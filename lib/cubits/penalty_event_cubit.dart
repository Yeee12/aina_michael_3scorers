import 'package:aina_michael_3scorers/models/penalty_event_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenaltyEventCubit extends Cubit<List<PenaltyEventModel>> {
  PenaltyEventCubit() : super([]);

  void loadEvents() {
    emit([
      PenaltyEventModel(
        playerName: "Lewandowski",
        playerImage: "assets/images/cancelo.png",
        order: 5,
        eventType: "goal",
        isRightSide: false,
      ),
      PenaltyEventModel(
        playerName: "A. Garcia",
        playerImage: "assets/images/garcia.png",
        order: 5,
        eventType: "success",
        isRightSide: true,
      ),
      PenaltyEventModel(
        playerName: "Lewandowski",
        playerImage: "assets/images/cancelo.png",
        order: 4,
        eventType: "goal",
        isRightSide: false,
      ),
      PenaltyEventModel(
        playerName: "A. Garcia",
        playerImage: "assets/images/garcia.png",
        order: 4,
        eventType: "success",
        isRightSide: true,
      ),
      PenaltyEventModel(
        playerName: "Lewandowski",
        playerImage: "assets/images/cancelo.png",
        order: 3,
        eventType: "goal",
        isRightSide: false,
      ),
      PenaltyEventModel(
        playerName: "A. Garcia",
        playerImage: "assets/images/garcia.png",
        order: 3,
        eventType: "success",
        isRightSide: true,
      ), PenaltyEventModel(
        playerName: "J. Cancelo",
        playerImage: "assets/images/cancelo.png",
        order: 2,
        eventType: "success",
        isRightSide: false,
      ),
      PenaltyEventModel(
        playerName: "A. Garcia",
        playerImage: "assets/images/garcia.png",
        order: 2,
        eventType: "success",
        isRightSide: true,
      ),
      PenaltyEventModel(
        playerName: "J. Cancelo",
        playerImage: "assets/images/cancelo.png",
        order: 1,
        eventType: "success",
        isRightSide: false,
      ),
      PenaltyEventModel(
        playerName: "A. Garcia",
        playerImage: "assets/images/garcia.png",
        order: 1,
        eventType: "success",
        isRightSide: true,
      )
    ]);
  }
}
