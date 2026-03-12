import '../game_logic/dice.dart';

class AIEngine {

  int decideMove(List<int> tokens) {

    int bestMove = 0;

    for(int i=0;i<tokens.length;i++){

      if(tokens[i] < 57){
        bestMove = i;
        break;
      }
    }

    return bestMove;
  }

}
