class TurnManager {

  int currentPlayer = 0;

  void nextTurn(int diceValue) {

    if(diceValue != 6){
      currentPlayer++;
    }

    if(currentPlayer > 3){
      currentPlayer = 0;
    }

  }

}
