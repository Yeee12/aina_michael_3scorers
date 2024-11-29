import 'package:aina_michael_3scorers/models/mometum_model.dart';
import 'package:bloc/bloc.dart';

class MomentumCubit extends Cubit<MomentumModel> {
  MomentumCubit()
      : super(MomentumModel(homePossession: 60, awayPossession: 40, momentumData: []));

  void updateMomentum(List<Momentum> newMomentumData, int homePossession, int awayPossession) {
    emit(MomentumModel(
      homePossession: homePossession,
      awayPossession: awayPossession,
      momentumData: newMomentumData,
    ));
  }
}
