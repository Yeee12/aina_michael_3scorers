import 'package:aina_michael_3scorers/cubits/extra_time_cubit.dart';
import 'package:aina_michael_3scorers/helpers/dotted_line.dart';
import 'package:aina_michael_3scorers/models/extra_time_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtraTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExtraTimeCubit()..loadEvents(),
      child: BlocBuilder<ExtraTimeCubit, List<ExtraTimeEvent>>(
        builder: (context, events) {
          if (events.isEmpty) {
            return Center(
              child: Text("No extra time events."),
            );
          }
          return ListView.separated(
            shrinkWrap: true, // Important for widgets inside another scrollable widget
            physics: NeverScrollableScrollPhysics(), // Prevents conflicts with parent scroll
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return _buildEventItem(event);
            },
            separatorBuilder: (context, index) {
              return DottedLine(height: 30); // Dotted line separator
            },
          );
        },
      ),
    );
  }

  Widget _buildEventItem(ExtraTimeEvent event) {
    final isRightSide = event.isRightSide;
    return Row(
      mainAxisAlignment:
      isRightSide ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isRightSide) _buildEventDetails(event),
        _buildTimelinePoint(event.minute, showPlayIcon: event.minute == 118),
        if (isRightSide) _buildEventDetails(event),
      ],
    );
  }

  Widget _buildTimelinePoint(int minute, {bool showPlayIcon = false}) {
    return Container(
      margin: EdgeInsets.only(left:37, right: 8 ),
      child: Row(
        children: [
          // Display the play image only if showPlayIcon is true
          if (showPlayIcon)
            Image.asset(
              "assets/images/play.png",
              width: 26, // Adjust size as needed
              height: 20,
            ),
          if (showPlayIcon) SizedBox(width: 8),
          // Display the minute as a circle
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "$minute",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetails(ExtraTimeEvent event) {
    return Container(

      child: Row(
        children: [
          // Card image or event icon before the player's name
          if (event.eventType == "red_card")
            Image.asset("assets/images/card.png"),
          if (event.eventType == "var")
            Image.asset("assets/images/var.png"),
          if (event.eventType == "goal")
            Image.asset("assets/images/football_.png"),
          SizedBox(width: 8), // Spacing between the icon and the player's name
          // Player name and event details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.playerName,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 3),
              Text(
                event.eventDetail,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(width: 12), // Spacing between the text and the player's image
          // Player image
          CircleAvatar(
            backgroundImage: AssetImage(event.playerImage),
          ),
        ],
      ),
    );
  }
}
