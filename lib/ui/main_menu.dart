import 'package:flutter/material.dart';
import 'lobby_screen.dart';

class MainMenu extends StatelessWidget {

  Widget button(String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Ludo King Clone")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            button("Play vs AI", () {}),
            button("2 Player Local", () {}),
            button("Online Multiplayer", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LobbyScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
