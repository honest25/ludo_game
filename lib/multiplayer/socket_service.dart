import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {

  late IO.Socket socket;

  void connect() {

    socket = IO.io(
      "https://ludo-backend.onrender.com",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("Connected to server");
    });
  }

  void createRoom() {
    socket.emit("create_room");
  }

  void joinRoom(String roomId) {
    socket.emit("join_room", roomId);
  }

  void rollDice() {
    socket.emit("roll_dice");
  }

  void moveToken(data) {
    socket.emit("move_token", data);
  }

}
