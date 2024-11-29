// widget/match_event_widget.dart
import 'package:aina_michael_3scorers/models/match_event.dart';
import 'package:flutter/material.dart';

class MatchEventWidget extends StatelessWidget {
  final MatchEvent event;

  const MatchEventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      event.isHomeTeam ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (event.isHomeTeam) _buildPlayerColumn(),
        Expanded(child: _buildEventDetails()),
        if (!event.isHomeTeam) _buildPlayerColumn(),
      ],
    );
  }

  Widget _buildPlayerColumn() {
    return Column(
      children: [
        Image.asset(event.playerImage, height: 40, width: 40),
        Text(event.playerName),
      ],
    );
  }

  Widget _buildEventDetails() {
    return Column(
      children: [
        Text('${event.minute}\'', style: TextStyle(fontWeight: FontWeight.bold)),
        Text(event.eventType),
        if (event.isGoalCancelled) Text('Goal Cancelled', style: TextStyle(color: Colors.red)),
      ],
    );
  }
}
