import 'package:aina_michael_3scorers/models/game_information.dart';

abstract class GameInfoState {}

class GameInfoInitial extends GameInfoState {}

class GameInfoLoading extends GameInfoState {}

class GameInfoLoaded extends GameInfoState {
  final GameInformation gameInfo;

  GameInfoLoaded(this.gameInfo);
}

class GameInfoError extends GameInfoState {
  final String error;

  GameInfoError(this.error);
}
