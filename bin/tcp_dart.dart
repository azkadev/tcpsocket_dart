import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:galaxeus_lib/galaxeus_lib.dart';

void main(List<String> args)async  {
  TcpSocketServer tcpSocketServer = TcpSocketServer();

  await tcpSocketServer.listen(
    host: "0.0.0.0",
    port: 8080,
    onOpen: (Socket socket) {
      socket.sendString("hai manies");
    },
    onClose: (Socket socket) async {
      await socket.close();
    },
    onMessage: (Socket socket, Uint8List rawData) {
      String data = utf8.decode(rawData);
      print(data);
      return socket.sendString("Hai ini dari server");
    },
  ); 
  print(tcpSocketServer.server.address.address);
}
