import 'package:aina_michael_3scorers/cubits/standing_state.dart';
import 'package:aina_michael_3scorers/models/standing_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StandingCubit extends Cubit<StandingState> {
  StandingCubit() : super(StandingInitial());

  void loadStandings() {
    try {
      emit(StandingLoading());

      // Simulate a data fetch
      final standings = [
        TeamStanding(
          rank: 1,
          teamName: "Girona",
          logo: "assets/images/girona.png",
          matchesPlayed: 8,
          wins: 8,
          draws: 0,
          losses: 0,
          goalsFor: 19,
          goalsAgainst: 1,
          points: 24,
        ),
        TeamStanding(
          rank: 4,
          teamName: "Barcelona",
          logo: "assets/images/barcelona.png",
          matchesPlayed: 8,
          wins: 2,
          draws: 4,
          losses: 1,
          goalsFor: 16,
          goalsAgainst: 2,
          points: 20,
        ),
      ];

      emit(StandingLoaded(standings));
    } catch (e) {
      emit(StandingError("Failed to load standings"));
    }
  }
}
