import 'dart:math';

class Dice {

  final Random _random = Random();

  int roll() {
    return _random.nextInt(6) + 1;
  }

}
