
import 'package:aina_michael_3scorers/models/ninety_minutes_event_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NinetyMinutesEventCubit extends Cubit<List<NinetyMinutesEventModel>> {
  NinetyMinutesEventCubit() : super([]);

  void loadEvents() {
    emit([
      NinetyMinutesEventModel(
        playerName: "J. Cancelo",
        playerImage: "assets/images/cancelo.png",
        eventDetail: "(Assist: L. Yamal)",
        minute: 90+15,
        eventType: "goal",
        isRightSide: false,
      ),
      NinetyMinutesEventModel(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Goal Cancelled)",
        minute: 88,
        eventType: "var",
        isRightSide: true,
      ),
      NinetyMinutesEventModel(
        playerName: "R. Lewandowski",
        playerImage: "",
        eventDetail: "",
        minute: 75,
        eventType: "sub",
        isRightSide: false,
      ),
      NinetyMinutesEventModel(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Own Goal)",
        minute: 63,
        eventType: "own_goal",
        isRightSide: true,
      ),
      NinetyMinutesEventModel(
        playerName: "R. Lewandowski",
        playerImage: "assets/images/lewandowski.png",
        eventDetail: "(Assist: L. Yamal)",
        minute: 57,
        eventType: "goal",
        isRightSide: false,
      ),
    ]);
  }
}
