
import 'package:aina_michael_3scorers/models/half_time_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HalfTimeEventCubit extends Cubit<List<HalfTimeEvent>> {
  HalfTimeEventCubit() : super([]);

  void loadEvents() {
    emit([
      HalfTimeEvent(
        playerName: "L Yamal",
        playerImage: "assets/images/yamal.png",
        eventDetail: "(Pen. Missed)",
        minute: 33,
        eventType: "penalty_miss",
        isRightSide: false,
      ),
      HalfTimeEvent(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Pen Scored)",
        minute: 30,
        eventType: "penalty_sucess",
        isRightSide: true,
      ),
      HalfTimeEvent(
        playerName: "J. Cancelo",
        playerImage: "assets/images/cancelo.png",
        eventDetail: "(Foul)",
        minute: 27,
        eventType: "foul_card",
        isRightSide: false,
      ),
      HalfTimeEvent(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Pen Scored)",
        minute: 25,
        eventType: "penalty_sucess",
        isRightSide: true,
      ),
      HalfTimeEvent(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Time Wasting)",
        minute: 15,
        eventType: "yellow_card",
        isRightSide: true,
      ),
      HalfTimeEvent(
        playerName: "J Cancelo",
        playerImage: "assets/images/cancelo.png",
        eventDetail: "(Penalty Awarded)",
        minute: 11,
        eventType: "var",
        isRightSide: false,
      ),
      HalfTimeEvent(
        playerName: "L Yamal",
        playerImage: "assets/images/yamal.png",
        eventDetail: "(Foul)",
        minute: 4,
        eventType: "red_card",
        isRightSide: false,
      ),
    ]);
  }
}
