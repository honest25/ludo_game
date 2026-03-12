import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {

  static final SocketService _instance = SocketService._internal();

  factory SocketService() {
    return _instance;
  }

  SocketService._internal();

  late IO.Socket socket;

  void connect() {

    socket = IO.io(
      "https://ludo-multiplayer-server.onrender.com",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("✅ Connected to Ludo Server");
    });

    socket.onDisconnect((_) {
      print("❌ Disconnected from Server");
    });

    socket.onConnectError((err) {
      print("Connection Error: $err");
    });

  }

}
