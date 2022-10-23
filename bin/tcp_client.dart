import 'dart:convert';
import 'dart:io';

import 'package:galaxeus_lib/galaxeus_lib.dart';

void main(List<String> arguments) {
  TcpSocketClient tcpSocketClient = TcpSocketClient(host: "0.0.0.0", port: 8080);
  tcpSocketClient.connect(
    onDataUpdate: (rawData) {
      if (rawData is List) {
        String data = utf8.decode((rawData as List).cast<int>());
        print(data);
      }
    },
    onDataConnection: (data) {
      print(data);
    },
  );
  stdin.listen((event) {
    String data = utf8.decode(event);
    tcpSocketClient.socket.sendString(data);
  });
}
