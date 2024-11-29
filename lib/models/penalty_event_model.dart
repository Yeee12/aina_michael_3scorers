class PenaltyEventModel {
  final String playerName;
  final String playerImage;
  final int order;
  final String eventType; // e.g., "goal", "foul", "red_card", "var"
  final bool isRightSide;

  PenaltyEventModel({
    required this.playerName,
    required this.playerImage,
    required this.order,
    required this.eventType,
    required this.isRightSide,
  });
}
