import 'package:aina_michael_3scorers/models/extra_time_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtraTimeCubit extends Cubit<List<ExtraTimeEvent>> {
  ExtraTimeCubit() : super([]);

  void loadEvents() {
    emit([
      ExtraTimeEvent(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Assist: A. Garcia)",
        minute: 118,
        eventType: "goal",
        isRightSide: true,
      ),
      ExtraTimeEvent(
        playerName: "J. Cancelo",
        playerImage: "assets/images/cancelo.png",
        eventDetail: "(Foul)",
        minute: 115,
        eventType: "red_card",
        isRightSide: false,
      ),
      ExtraTimeEvent(
        playerName: "Y. Couto",
        playerImage: "assets/images/couto.png",
        eventDetail: "(Goal Cancelled)",
        minute: 105,
        eventType: "var",
        isRightSide: true,
      ),
    ]);
  }
}
