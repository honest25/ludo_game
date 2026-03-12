import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {

  late IO.Socket socket;

  void connect(){

    socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("Connected to server");
    });

  }

  void createRoom(){
    socket.emit("createRoom");
  }

  void joinRoom(String code){
    socket.emit("joinRoom", code);
  }

}
