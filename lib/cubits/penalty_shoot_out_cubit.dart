import 'package:aina_michael_3scorers/models/penalty_shoot_out_model.dart';
import 'package:bloc/bloc.dart';

class PenaltyShootoutCubit extends Cubit<List<PenaltyShootoutModel>> {
  PenaltyShootoutCubit() : super([]);

  // Load penalty shootout data
  void loadPenaltyShootoutData() {
    final data = [
      PenaltyShootoutModel(
        teamName: "Barcelona",
        teamLogo: "assets/images/barcelona.png",
        score: 4,
        penalties: [true, true, true, true, false],
      ),
      PenaltyShootoutModel(
        teamName: "Girona",
        teamLogo: "assets/images/girona.png",
        score: 2,
        penalties: [true, false, true, false, false],
      ),
    ];
    emit(data);
  }
}
