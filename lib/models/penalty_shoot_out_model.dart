class PenaltyShootoutModel {
  final String teamName;
  final String teamLogo;
  final int score;
  final List<bool> penalties; // true for scored, false for missed

  PenaltyShootoutModel({
    required this.teamName,
    required this.teamLogo,
    required this.score,
    required this.penalties,
  });
}
