import '../game_logic/models.dart';

class LudoAI {
  static Token? getBestMove(Player aiPlayer, int diceValue, List<Player> allPlayers) {
    List<Token> movableTokens = aiPlayer.tokens.where((t) {
      if (t.position == -1) return diceValue == 6;
      return t.position + diceValue <= 56; // 56 is home
    }).toList();

    if (movableTokens.isEmpty) return null;

    // Priority 1: Move out of base if possible
    for (var token in movableTokens) {
      if (token.position == -1 && diceValue == 6) return token;
    }

    // Priority 2: Can kill an opponent?
    for (var token in movableTokens) {
      int targetPos = token.position + diceValue;
      // Logic to check if targetPos contains an opponent token and is NOT a safe zone
      // If yes, return this token.
    }

    // Priority 3: Move token closest to home
    movableTokens.sort((a, b) => b.position.compareTo(a.position));
    return movableTokens.first;
  }
}
