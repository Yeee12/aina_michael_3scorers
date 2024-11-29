part of 'match_cubit.dart';

abstract class MatchState {}

class MatchLoading extends MatchState {}

class MatchLoaded extends MatchState {
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final List<String> homeScorers;
  final List<String> awayScorers;

  MatchLoaded({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.homeScorers,
    required this.awayScorers,
  });
}
