import 'package:aina_michael_3scorers/helpers/custom_tab_bar.dart';
import 'package:aina_michael_3scorers/widgets/game_info_widget.dart';
import 'package:aina_michael_3scorers/widgets/match_highlight_widget.dart';
import 'package:aina_michael_3scorers/widgets/match_timeline_widget.dart';
import 'package:aina_michael_3scorers/widgets/mometum_graph.dart';
import 'package:aina_michael_3scorers/widgets/penalty_shootout_widget.dart';
import 'package:aina_michael_3scorers/widgets/player_of_the_match_widget.dart';
import 'package:aina_michael_3scorers/widgets/standing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aina_michael_3scorers/cubits/match_cubit.dart';
import 'package:aina_michael_3scorers/cubits/match_event_cubit.dart'; // Import MatchEventCubit
import 'package:aina_michael_3scorers/helpers/custom_bottom_nav_bar.dart';
import 'package:aina_michael_3scorers/screen/prev_matches.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({super.key});

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PrevMatches()),
        );
        break;
      case 1:
        Navigator.pushNamed(context, '/momentum');
        break;
      case 2:
        print("Navigate to Fantasy");
        break;
      case 3:
        print("Navigate to Shop");
        break;
      case 4:
        print("Navigate to My Profile");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(352),
        child: Stack(
          children: [
            Positioned(
              left: -0.08,
              child: Image.asset(
                "assets/images/rec.png",
                width: 430,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 64,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, 0); // Pass the index back
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Match Details',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.notifications_none,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: BlocProvider(
                create: (_) => MatchCubit()..fetchMatchDetails(),
                child: BlocBuilder<MatchCubit, MatchState>(
                  builder: (context, state) {
                    if (state is MatchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      );
                    } else if (state is MatchLoaded) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset("assets/images/barcelona.png", height: 50),
                                    Text(
                                      state.homeTeam,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${state.homeScore}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: " - ",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${state.awayScore}",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 32,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text("(4 - 2)", style: TextStyle(color: Colors.grey)),
                                    const SizedBox(height: 4),
                                    const Text("Penalty", style: TextStyle(color: Colors.grey)),
                                    const SizedBox(height: 4),
                                    Image.asset("assets/images/footballl.png", height: 15, width: 15),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset("assets/images/girona.png", height: 50),
                                    Text(
                                      state.awayTeam,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.homeScorers.map((scorer) {
                                    return Text(
                                      scorer,
                                      style: const TextStyle(color: Color(0xffe0e0e0)),
                                    );
                                  }).toList(),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: state.awayScorers.map((scorer) {
                                    return Text(
                                      scorer,
                                      style: const TextStyle(color: Color(0xffe0e0e0)),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else if (state is MatchError) {
                      return Center(
                        child: Text(state.message, style: const TextStyle(color: Colors.red)),
                      );
                    }
                    return const Center(
                      child: Text(
                        "Something went wrong!",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 264,
              left: 203.21,
              child: Image.asset("assets/images/logs.png", width: 24, height: 24),
            ),
            Positioned(
              top: 308,
              left: 0,
              right: 0,
              child: CustomTabBar(
                tabs: ["Overview", "Line-up", "Statistics", "Matches"],
                initialIndex: 0,
                onTabSelected: (index) {
                  // Handle tab selection
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 398,
              child: MatchHighlight(),
            ),
            SizedBox(height: 20),
            PlayerOfMatchCard(),
            SizedBox(height: 20),
            PenaltyShootoutWidget(),
            SizedBox(height: 20),
            MomentumGraph(),
            SizedBox(height: 20),
            BlocProvider(
              create: (_) => MatchEventCubit()..loadMatchEvents(),
              child: MatchTimelineWidget(),
            ),
            SizedBox(height: 20),
            StandingWidget(),
            SizedBox(height: 20),
            GameInfoWidget(),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
