import '../game_logic/token.dart';

enum Difficulty {
  easy,
  medium,
  hard
}

class AIPlayer {

  Difficulty difficulty;

  AIPlayer(this.difficulty);

  Token chooseMove(List<Token> tokens, int diceValue){

    switch(difficulty){

      case Difficulty.easy:
        return tokens.first;

      case Difficulty.medium:
        return tokens
            .where((t) => !t.isHome)
            .toList()
            .first;

      case Difficulty.hard:
        tokens.sort((a,b) => b.position.compareTo(a.position));
        return tokens.first;

    }

  }

}
