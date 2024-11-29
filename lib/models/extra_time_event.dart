class ExtraTimeEvent {
  final String playerName;
  final String playerImage;
  final String eventDetail;
  final int minute;
  final String eventType; // e.g., "goal", "foul", "red_card", "var"
  final bool isRightSide;

  ExtraTimeEvent({
    required this.playerName,
    required this.playerImage,
    required this.eventDetail,
    required this.minute,
    required this.eventType,
    required this.isRightSide,
  });
}
