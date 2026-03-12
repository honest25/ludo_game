import 'package:flame/game.dart';

class LudoGameEngine extends FlameGame {

  @override
  Future<void> onLoad() async {

    await images.loadAll([
      "board/ludo_board.png",
      "tokens/red.png",
      "tokens/blue.png",
      "tokens/green.png",
      "tokens/yellow.png"
    ]);

  }

}
