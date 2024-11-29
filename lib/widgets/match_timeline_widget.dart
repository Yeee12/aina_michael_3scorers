
import 'package:aina_michael_3scorers/widgets/half_time_widget.dart';
import 'package:aina_michael_3scorers/widgets/penalty_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aina_michael_3scorers/models/ninety_minutes_event_model.dart';
import 'package:aina_michael_3scorers/widgets/ninety_minutes_event_widget.dart';
import 'package:aina_michael_3scorers/cubits/ninety_minutes_event_cubit.dart';
import 'package:aina_michael_3scorers/helpers/dotted_line.dart';
import 'package:aina_michael_3scorers/helpers/text_with_border.dart';
import 'package:aina_michael_3scorers/widgets/extra_time_widget.dart';

class MatchTimelineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398,
      child: Column(
        children: [
          // Match Header
          _buildHeader(),

          SizedBox(height: 10),

          // Clock Image
          Image.asset("assets/images/clock.png"),

          // Penalty Section
          DottedLine(height: 30),
          TextWithBorder(text: "Penalties (4 - 2)"),
          DottedLine(height: 40),
          PenaltyEventWidget(),
          // Extra-Time Section
          DottedLine(height: 30),
          TextWithBorder(text: "Extra-Time (0 - 0)"),
          DottedLine(height: 30),
          ExtraTimeWidget(),

          // End of 90 Minutes Section
          DottedLine(height: 20),
          TextWithBorder(text: "End of 90 minutes (0 - 0)"),
          DottedLine(height: 20),
          NinetyMinutesEventWidget(),
          DottedLine(height: 30),
          TextWithBorder(text: "Half-time(0 - 0)"),
          DottedLine(height: 30),
          HalfTimeWidget(),
        ],
      ),
    );
  }

  // Helper for the Header
  Widget _buildHeader() {
    return Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/barcelona.png",
              width: 24,
              height: 24,
            ),
            const Text(
              "Match Current Stat",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Image.asset(
              "assets/images/girona.png",
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
