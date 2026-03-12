import 'package:flutter/material.dart';
import '../multiplayer/socket_service.dart';

class LobbyScreen extends StatefulWidget {
  @override
  _LobbyScreenState createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {

  String roomId = "";

  @override
  void initState() {
    super.initState();

    // Server response listener
    SocketService().socket.on("room_created", (data) {
      setState(() {
        roomId = data;
      });

      print("Room Created: $roomId");
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Multiplayer Lobby")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                SocketService().createRoom();
              },
              child: Text("Create Room"),
            ),

            SizedBox(height: 20),

            Text("Room Code: $roomId")

          ],
        ),
      ),
    );
  }
}
