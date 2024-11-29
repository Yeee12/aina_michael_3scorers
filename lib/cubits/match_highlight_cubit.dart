import 'package:flutter_bloc/flutter_bloc.dart';

class MatchHighlightState {}

class MatchHighlightLoading extends MatchHighlightState {}

class MatchHighlightLoaded extends MatchHighlightState {
  final Map<String, dynamic> matchDetails;
  MatchHighlightLoaded(this.matchDetails);
}

class MatchHighlightCubit extends Cubit<MatchHighlightState> {
  MatchHighlightCubit() : super(MatchHighlightLoading());

  void loadMatchDetails() {
    Future.delayed(Duration(seconds: 1), () {
      emit(MatchHighlightLoaded({
        "team1": {"name": "Barcelona", "logo": "assets/images/barcelona.png"},
        "team2": {"name": "Girona", "logo": "assets/images/girona.png"},
        "background": "assets/images/stadium.png"
      }));
    });
  }
}
