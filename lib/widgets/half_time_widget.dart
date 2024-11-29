import 'package:aina_michael_3scorers/cubits/half_time_event_cubit.dart';
import 'package:aina_michael_3scorers/helpers/dotted_line.dart';
import 'package:aina_michael_3scorers/models/half_time_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HalfTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HalfTimeEventCubit()..loadEvents(),
      child: BlocBuilder<HalfTimeEventCubit, List<HalfTimeEvent>>(
        builder: (context, events) {
          if (events.isEmpty) {
            return Center(
              child: Text("No half-time events."),
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

  Widget _buildEventItem(HalfTimeEvent event) {
    final isRightSide = event.isRightSide;
    return Stack(
      alignment: Alignment.center, // Ensures minute stays centered
      children: [
        Row(
          mainAxisAlignment:
          isRightSide ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isRightSide) _buildEventDetails(event, isRightSide),
            Spacer(), // Push content to the correct side
            if (isRightSide) _buildEventDetails(event, isRightSide),
          ],
        ),
        // Minute timeline in the center
        _buildTimelinePoint(event.minute, showPlayIcon: event.minute == 45),
      ],
    );
  }

  Widget _buildTimelinePoint(int minute, {bool showPlayIcon = false}) {
    return Column(
      children: [
        // Centered minute circle
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
        if (showPlayIcon) SizedBox(height: 4), // Spacing if the play icon is shown
        if (showPlayIcon)
          Image.asset(
            "assets/images/play.png",
            width: 26,
            height: 20,
          ),
      ],
    );
  }

  Widget _buildEventDetails(HalfTimeEvent event, bool isRightSide) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isRightSide
          ? [
        // Event type image appears on the **left** for right-side events
        _buildEventTypeImage(event),
        SizedBox(width: 8), // Spacing
        _buildPlayerDetails(event),
      ]
          : [
        // Player details appear first for left-side events
        _buildPlayerDetails(event),
        SizedBox(width: 8), // Spacing
        // Event type image appears on the **right** for left-side events
        _buildEventTypeImage(event),
      ],
    );
  }

  Widget _buildEventTypeImage(HalfTimeEvent event) {
    String imagePath;
    switch (event.eventType) {
      case "foul_card":
        imagePath = "assets/images/card.png";
        break;
      case "red_card":
        imagePath = "assets/images/red.png";
        break;
      case "yellow_card":
        imagePath = "assets/images/yellow.png";
        break;
      case "var":
        imagePath = "assets/images/var.png";
        break;
      case "goal":
        imagePath = "assets/images/football_.png";
        break;
      case "penalty_miss":
        imagePath = "assets/images/penalty_miss.png";
        break;
      case "penalty_sucess":
        imagePath = "assets/images/penalty_sucess.png";
        break;
      default:
        imagePath = ""; // Default empty path if no event type matches
    }
    return imagePath.isNotEmpty
        ? Image.asset(
      imagePath,
      width: 24,
      height: 24,
    )
        : SizedBox();
  }

  Widget _buildPlayerDetails(HalfTimeEvent event) {
    return Row(
      children: [
        // Player image
        CircleAvatar(
          backgroundImage: AssetImage(event.playerImage),
        ),
        SizedBox(width: 8), // Spacing between the player's image and details
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
      ],
    );
  }
}
