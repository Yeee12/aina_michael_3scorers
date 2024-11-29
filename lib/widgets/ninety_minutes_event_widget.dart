import 'package:aina_michael_3scorers/cubits/ninety_minutes_event_cubit.dart';
import 'package:aina_michael_3scorers/helpers/dotted_line.dart';
import 'package:aina_michael_3scorers/models/ninety_minutes_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NinetyMinutesEventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NinetyMinutesEventCubit()..loadEvents(),
      child: BlocBuilder<NinetyMinutesEventCubit, List<NinetyMinutesEventModel>>(
        builder: (context, events) {
          if (events.isEmpty) {
            return Center(
              child: Text("No ninety-minutes events."),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return _buildEventItem(event);
            },
            separatorBuilder: (context, index) {
              return DottedLine(height: 30);
            },
          );
        },
      ),
    );
  }

  Widget _buildEventItem(NinetyMinutesEventModel event) {
    final isRightSide = event.isRightSide;
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment:
          isRightSide ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isRightSide) _buildEventDetails(event, isRightSide),
            Spacer(),
            if (isRightSide) _buildEventDetails(event, isRightSide),
          ],
        ),
        _buildTimelinePoint(event.minute, showPlayIcon: event.minute == 90 || event.minute == 57 || event.minute == 105),
      ],
    );
  }

  Widget _buildTimelinePoint(int minute, {bool showPlayIcon = false}) {
    final isRightSideMinute = minute == 57 || minute == 105; // 90+15 = 105

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isRightSideMinute && showPlayIcon) // Play icon on the left
          Image.asset(
            "assets/images/play.png",
            width: 26,
            height: 20,
          ),
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
        if (isRightSideMinute && showPlayIcon) // Play icon on the right
          Image.asset(
            "assets/images/play.png",
            width: 26,
            height: 20,
          ),
      ],
    );
  }

  Widget _buildEventDetails(NinetyMinutesEventModel event, bool isRightSide) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isRightSide
          ? [
        _buildEventTypeImage(event),
        SizedBox(width: 8),
        _buildPlayerDetails(event),
      ]
          : [
        _buildPlayerDetails(event),
        SizedBox(width: 16),
        _buildEventTypeImage(event),
      ],
    );
  }

  Widget _buildEventTypeImage(NinetyMinutesEventModel event) {
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
      case "own_goal":
        imagePath = "assets/images/own goal.png";
        break;
      default:
        imagePath = "";
    }
    return imagePath.isNotEmpty
        ? Image.asset(
      imagePath,
      width: 24,
      height: 24,
    )
        : SizedBox(width: 10,);
  }

  Widget _buildPlayerDetails(NinetyMinutesEventModel event) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(event.playerImage),
        ),
        SizedBox(width: 10),
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
