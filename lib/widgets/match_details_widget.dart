import 'package:flutter/material.dart';

class MatchDetailsWidget extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final List<String> homeScorers;
  final List<String> awayScorers;

  const MatchDetailsWidget({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.homeScorers,
    required this.awayScorers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset("assets/images/549.png"),
                Text(homeTeam, style: TextStyle(color: Colors.white)),
              ],
            ),
            Column(
              children: [
                Text("$homeScore - $awayScore", style: TextStyle(color: Colors.grey, fontSize: 24)),
                Text("(4-2) Penalty", style: TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              children: [
                Image.asset("assets/images/girona.png"),
                Text(awayTeam, style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: homeScorers.map((scorer) {
                  return Text(scorer, style: TextStyle(color: Colors.white));
                }).toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: awayScorers.map((scorer) {
                  return Text(scorer, style: TextStyle(color: Colors.white));
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
