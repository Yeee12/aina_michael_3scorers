import 'package:aina_michael_3scorers/cubits/ninety_minutes_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aina_michael_3scorers/cubits/game_info_cubit.dart';
import 'package:aina_michael_3scorers/cubits/mometum_cubit.dart';
import 'package:aina_michael_3scorers/cubits/standing_cubit.dart';
import 'screen/prev_matches.dart';
import 'screen/match_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MomentumCubit()),
        BlocProvider(create: (context) => StandingCubit()..loadStandings()),
        BlocProvider(create: (_) => GameInfoCubit()..loadGameInfo()),
      ],
      child: MaterialApp(
        home: PrevMatches(), // Initial screen
        routes: {
          '/momentum': (context) => BlocProvider.value(
            value: BlocProvider.of<MomentumCubit>(context),
            child: MatchDetails(),
          ),
        },
      ),
    );
  }
}
