import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../engine/ludo_game_engine.dart';

class GameScreen extends StatelessWidget {

  final LudoGameEngine game = LudoGameEngine();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GameWidget(game: game),
    );

  }

}
