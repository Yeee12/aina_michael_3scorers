import 'package:flutter_bloc/flutter_bloc.dart';

// MatchState definition
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

class MatchError extends MatchState {
  final String message;

  MatchError(this.message);
}

// MatchCubit definition
class MatchCubit extends Cubit<MatchState> {
  MatchCubit() : super(MatchLoading());

  void fetchMatchDetails() {
    // Simulate fetching match details
    Future.delayed(Duration(seconds: 2), () {
      emit(MatchLoaded(
        homeTeam: "Barcelona",
        awayTeam: "Girona",
        homeScore: 3,
        awayScore: 3,
        homeScorers: ["R. Lewandowski 11'", "J. Felix 25'", "J. Cancelo 33'"],
        awayScorers: ["Y. Couto 4'", "A. Garcia 15'", "I. Martin 27'"],
      ));
    });
  }
}
