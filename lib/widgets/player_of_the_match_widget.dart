import 'package:aina_michael_3scorers/cubits/player_of_the_match_cubit.dart';
import 'package:aina_michael_3scorers/cubits/player_of_the_match_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerOfMatchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayerOfMatchCubit()..loadPlayerDetails(),
      child: BlocBuilder<PlayerOfMatchCubit, PlayerOfMatchState>(
        builder: (context, state) {
          if (state is PlayerOfMatchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlayerOfMatchLoaded) {
            final player = state.playerDetails;

            return Container(
              height: 141,
              width: 398,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Container(
                      width: 398,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xff008f8f),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Player Of The Match",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          child:  // Player Image
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/de_jong.png"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Player Info
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              player["name"],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  player["teamLogo"],
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  player["team"],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Player Rating
                        Container(
                          height: 21,
                          width: 33,
                          padding: const EdgeInsets.only(left: 5, right: 2),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            player["rating"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Error loading player details"),
            );
          }
        },
      ),
    );
  }
}
