class Token {

  int position = -1;
  bool isHome = false;

  void move(int steps) {

    if(position == -1 && steps == 6){
      position = 0;
      return;
    }

    if(position >= 0){
      position += steps;
    }

    if(position >= 56){
      isHome = true;
    }

  }

}
