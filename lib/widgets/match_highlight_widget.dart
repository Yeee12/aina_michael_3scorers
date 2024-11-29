import 'package:aina_michael_3scorers/cubits/match_highlight_cubit.dart';
import 'package:aina_michael_3scorers/helpers/highlight_play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchHighlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatchHighlightCubit()..loadMatchDetails(),
      child: Scaffold(
        body: BlocBuilder<MatchHighlightCubit, MatchHighlightState>(
          builder: (context, state) {
            if (state is MatchHighlightLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MatchHighlightLoaded) {
              final matchDetails = state.matchDetails;
              return Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      matchDetails["background"],
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Overlay content with border radius
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal spacing between children
                            children: [
                              // Team 1 Logo and Name
                              Column(
                                children: [
                                  Image.asset(
                                    matchDetails["team1"]["logo"],
                                    width: 80,
                                    height: 80,
                                  ),
                                  Text(
                                    matchDetails["team1"]["name"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              // Play Button
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: HighlightPlayButton(),
                              ),
                              // Team 2 Logo and Name
                              Column(
                                children: [
                                  Image.asset(
                                    matchDetails["team2"]["logo"],
                                    width: 80,
                                    height: 80,
                                  ),
                                  Text(
                                    matchDetails["team2"]["name"],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                      left: 289,
                      child:   const Text(
                        "Watch Highlight",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text("Error loading match details"),
              );
            }
          },
        ),
      ),
    );
  }
}
