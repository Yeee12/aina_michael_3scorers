
abstract class PlayerOfMatchState {}

class PlayerOfMatchLoading extends PlayerOfMatchState {}

class PlayerOfMatchLoaded extends PlayerOfMatchState {
  final Map<String, dynamic> playerDetails;

  PlayerOfMatchLoaded(this.playerDetails);
}