import 'dart:math';

class Dice {

  static int roll() {
    Random random = Random();
    return random.nextInt(6) + 1;
  }

}
