// model/match_event.dart
class MatchEvent {
  final String playerName;
  final String playerImage;
  final String eventType; // e.g., "Goal", "Penalty Missed"
  final String minute; // e.g., "90+15", "57", "33"
  final bool isHomeTeam; // To align left or right
  final bool isGoalCancelled; // To show goal cancellation

  MatchEvent({
    required this.playerName,
    required this.playerImage,
    required this.eventType,
    required this.minute,
    required this.isHomeTeam,
    this.isGoalCancelled = false,
  });
}
