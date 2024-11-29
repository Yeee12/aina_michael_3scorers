import 'package:aina_michael_3scorers/cubits/penalty_shoot_out_cubit.dart';
import 'package:aina_michael_3scorers/models/penalty_shoot_out_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenaltyShootoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PenaltyShootoutCubit()..loadPenaltyShootoutData(),
      child: BlocBuilder<PenaltyShootoutCubit, List<PenaltyShootoutModel>>(
        builder: (context, shootoutData) {
          if (shootoutData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Bar
                Container(
                  width: 398,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xff008f8f),
                    borderRadius: BorderRadius.circular(10),
                  ),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Penalty Shootout",  style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w700,
                         fontSize: 14,
                       ),)
                     ],
                   ),
                 ),
                ),
                const SizedBox(height: 16),

                // Shootout Rows
                ...shootoutData.map((team) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Score and Logo
                          Column(
                            children: [
                              Text(
                                "(${team.score})",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Image.asset(
                                team.teamLogo,
                                height: 30,
                                width: 30,
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),

                          // Penalty Icons
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute images evenly
                              children: team.penalties.map((scored) {
                                return Image.asset(
                                  scored
                                      ? "assets/images/penalty_sucess.png" // Image for scored penalty
                                      : "assets/images/penalty_miss.png", // Image for missed penalty
                                  height: 20,
                                  width: 20,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }
}
