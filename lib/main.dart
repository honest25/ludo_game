import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'engine/ludo_game.dart';

void main() {
  runApp(const LudoApp());
}

class LudoApp extends StatelessWidget {
  const LudoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Green Ludo',
      theme: ThemeData.dark(),
      home: const MainMenu(), // Start with UI
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('LUDO KING CLONE', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const GameScreen())
              ),
              child: const Text('Play Local / vs AI'),
            ),
            ElevatedButton(
              onPressed: () { /* TODO: Navigate to Multiplayer Lobby */ },
              child: const Text('Play Online'),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // The GameWidget connects Flutter UI to the Flame engine
        child: GameWidget(game: LudoFlameGame()), 
      ),
    );
  }
}
