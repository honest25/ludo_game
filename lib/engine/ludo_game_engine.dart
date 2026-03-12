import 'package:flame/game.dart';
import 'package:flame/components.dart';
import '../game_logic/dice.dart';

class LudoGameEngine extends FlameGame {

  late SpriteComponent board;
  Dice dice = Dice();

  @override
  Future<void> onLoad() async {

    board = SpriteComponent()
      ..sprite = await loadSprite('board/ludo_board.png')
      ..size = size;

    add(board);
  }

  void rollDice() {
    int value = dice.roll();
    print("Dice rolled: $value");
  }

}
