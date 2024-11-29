import 'package:aina_michael_3scorers/cubits/standing_cubit.dart';
import 'package:aina_michael_3scorers/cubits/standing_state.dart';
import 'package:aina_michael_3scorers/models/standing_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandingWidget extends StatefulWidget {
  @override
  _StandingWidgetState createState() => _StandingWidgetState();
}

class _StandingWidgetState extends State<StandingWidget> {
  @override
  void initState() {
    super.initState();
    // Load standings when the widget is mounted
    context.read<StandingCubit>().loadStandings();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingCubit, StandingState>(
      builder: (context, state) {
        if (state is StandingInitial) {
          return Center(child: Text('Initializing standings...'));
        } else if (state is StandingLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is StandingLoaded) {
          return _buildStandingsTable(state.standings);
        } else if (state is StandingError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: Text('Unknown state')); // Should rarely happen now
        }
      },
    );
  }

  Widget _buildStandingsTable(List<TeamStanding> standings) {
    return Container(
      width: 398,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 10),
          _buildStatLabels(),
          Column(
            children: [
              // Directly passing the rank (which is already set in the Cubit) along with team data
              for (var team in standings) ...[
                _buildTeamRow(team),
                Divider(),  // Divider between teams
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 398,
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xff008f8f),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Live Match Standings",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/logs.png", // Logo path
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 5),
                const Text(
                  "LaLiga",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, // Bold text for emphasis
                      fontSize: 14,
                      color: Colors.white // Adjust font size
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Build the label row (MP, W, D, L, etc.)
  Widget _buildStatLabels() {
    return Row(
      children: [
        // Space for the team rank, logo, and name
        SizedBox(width: 150),
        _buildStatLabel("MP"),
        _buildStatLabel("W"),
        _buildStatLabel("D"),
        _buildStatLabel("L"),
        _buildStatLabel("GF"),
        _buildStatLabel("GA"),
        _buildStatLabel("Pt"),
      ],
    );
  }

  Widget _buildStatLabel(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add gap of 4px
        child: Text(
          label,
          textAlign: TextAlign.center, // Center align the label
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  // Build the row for each team's stats, including rank
  Widget _buildTeamRow(TeamStanding team) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Rank
          SizedBox(
            width: 30,
            child: Text(
              "${team.rank}", // Display the rank directly from the team data
              textAlign: TextAlign.center, // Center align the rank
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          // Team logo and name
          Row(
            children: [
              Image.asset(team.logo, width: 24, height: 24),
              SizedBox(width: 10),
              Text(
                team.teamName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ],
          ),
          // Team stats
          SizedBox(width: 40), // Adjust spacing for team name
          _buildStatValue(team.matchesPlayed),
          _buildStatValue(team.wins),
          _buildStatValue(team.draws),
          _buildStatValue(team.losses),
          _buildStatValue(team.goalsFor),
          _buildStatValue(team.goalsAgainst),
          _buildStatValue(team.points, bold: true),
        ],
      ),
    );
  }

  Widget _buildStatValue(int value, {bool bold = false}) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 4), // Gap between label and value
          Text(
            "$value",
            textAlign: TextAlign.center, // Center align the value
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
