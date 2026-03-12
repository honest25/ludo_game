enum TokenColor { red, blue, green, yellow }
enum PlayerType { human, ai, remote }

class Token {
  final TokenColor color;
  final int id;
  int position = -1; // -1 means in base
  bool isSafe = true;

  Token(this.color, this.id);
}

class Player {
  final TokenColor color;
  final PlayerType type;
  List<Token> tokens;

  Player(this.color, this.type) : tokens = List.generate(4, (index) => Token(color, index));
}
