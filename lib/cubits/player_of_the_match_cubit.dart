import 'package:aina_michael_3scorers/cubits/player_of_the_match_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerOfMatchError extends PlayerOfMatchState {}

// Cubit (Bloc)
class PlayerOfMatchCubit extends Cubit<PlayerOfMatchState> {
  PlayerOfMatchCubit() : super(PlayerOfMatchLoading());

  void loadPlayerDetails() {
    // Simulate loading data
    Future.delayed(const Duration(seconds: 2), () {
      emit(PlayerOfMatchLoaded({
        "name": "F. Dejong",
        "team": "Barcelona",
        "rating": 8.0,
        "image": "assets/images/player.png",
        "teamLogo": "assets/images/barcelona.png"
      }));
    });
  }
}