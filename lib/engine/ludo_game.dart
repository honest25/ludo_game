import 'package:flame/game.dart';
import 'package:flame/components.dart';
import '../game_logic/models.dart';

class LudoFlameGame extends FlameGame {
  late SpriteComponent board;
  List<Player> players = [];
  int currentTurnIndex = 0;
  
  // Define safe zones (indices of the path array)
  final List<int> safeZones = [0, 8, 13, 21, 26, 34, 39, 47];

  @override
  Future<void> onLoad() async {
    super.onLoad();
    // Load Board Asset
    board = SpriteComponent()
      ..sprite = await loadSprite('board/ludo_board.png')
      ..size = size;
    add(board);
    
    _initializePlayers();
  }

  void _initializePlayers() {
    // Setup for 4 players (Local/AI mix as an example)
    players = [
      Player(TokenColor.red, PlayerType.human),
      Player(TokenColor.blue, PlayerType.ai),
      Player(TokenColor.green, PlayerType.ai),
      Player(TokenColor.yellow, PlayerType.ai),
    ];
    // TODO: Instantiate and add Token SpriteComponents to the engine here
  }

  int rollDice() {
    // Simple 1-6 generator
    return (DateTime.now().millisecondsSinceEpoch % 6) + 1;
  }

  void moveToken(Token token, int diceValue) {
    if (token.position == -1 && diceValue == 6) {
      token.position = 0; // Move out of base
    } else if (token.position != -1) {
      token.position += diceValue;
      // TODO: Add pathing logic to convert position index to x,y coordinates on the board
      // TODO: Add collision detection to check if opponent token is on the new tile
    }
  }
}
