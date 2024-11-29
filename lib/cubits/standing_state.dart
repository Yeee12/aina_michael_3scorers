

import 'package:aina_michael_3scorers/models/standing_model.dart';

abstract class StandingState {}

class StandingInitial extends StandingState {}

class StandingLoading extends StandingState {}

class StandingLoaded extends StandingState {
  final List<TeamStanding> standings;

  StandingLoaded(this.standings);
}

class StandingError extends StandingState {
  final String errorMessage;

  StandingError(this.errorMessage);
}
