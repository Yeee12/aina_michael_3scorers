// cubit/match_cubit.dart
import 'package:aina_michael_3scorers/models/match_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchEventCubit extends Cubit<List<MatchEvent>> {
  MatchEventCubit() : super([]);

  void loadMatchEvents() {
    emit([
      MatchEvent(
        playerName: 'L. Yamal',
        playerImage: 'assets/images/yamal.png',
        eventType: 'Foul',
        minute: '4',
        isHomeTeam: true,
      ),
      MatchEvent(
        playerName: 'Y. Couto',
        playerImage: 'assets/images/couto.png',
        eventType: 'Time Wasting',
        minute: '15',
        isHomeTeam: false,
      ),
      MatchEvent(
        playerName: 'Y. Couto',
        playerImage: 'assets/images/couto.png',
        eventType: 'Penalty Scored',
        minute: '25',
        isHomeTeam: false,
      ),
      MatchEvent(
        playerName: 'J. Cancelo',
        playerImage: 'assets/images/cancelo.png',
        eventType: 'Foul',
        minute: '27',
        isHomeTeam: false,
      ),
      MatchEvent(
        playerName: 'L. Yamal',
        playerImage: 'assets/images/yamal.png',
        eventType: 'Penalty Missed',
        minute: '33',
        isHomeTeam: true,
      ),
      MatchEvent(
        playerName: 'R. Lewandowski',
        playerImage: 'assets/images/lewandowski.png',
        eventType: 'Goal (Assist: L. Yamal)',
        minute: '57',
        isHomeTeam: true,
      ),
      // Add the remaining events similarly
    ]);
  }
}
