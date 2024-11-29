import 'package:aina_michael_3scorers/cubits/game_info_state.dart';
import 'package:aina_michael_3scorers/models/game_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameInfoCubit extends Cubit<GameInfoState> {
  GameInfoCubit() : super(GameInfoInitial());

  void loadGameInfo() {
    emit(GameInfoLoading());

    try {
      // Simulating loading data
      final gameInfo = GameInformation(
        venue: "Camp Nou",
        date: "March 03, 2024",
        time: "21:00",
        referee: "Stephen Hosea",
        stadiumCapacity: 99354,
      );

      emit(GameInfoLoaded(gameInfo));
    } catch (e) {
      emit(GameInfoError("Failed to load game information"));
    }
  }
}
