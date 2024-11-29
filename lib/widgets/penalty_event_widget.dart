import 'package:aina_michael_3scorers/cubits/penalty_event_cubit.dart';
import 'package:aina_michael_3scorers/helpers/dotted_line.dart';
import 'package:aina_michael_3scorers/models/penalty_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenaltyEventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PenaltyEventCubit()..loadEvents(),
      child: BlocBuilder<PenaltyEventCubit, List<PenaltyEventModel>>(
        builder: (context, events) {
          if (events.isEmpty) {
            return Center(
              child: Text("No penalty events."),
            );
          }

          // Group events by order number
          Map<int, List<PenaltyEventModel>> groupedEvents = {};
          for (var event in events) {
            groupedEvents.putIfAbsent(event.order, () => []).add(event);
          }

          // Flatten the grouped events into a list of rows
          List<Widget> eventRows = [];
          groupedEvents.forEach((order, eventList) {
            eventRows.add(_buildEventItem(eventList, order));
          });

          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: eventRows.length,
            itemBuilder: (context, index) {
              return eventRows[index];
            },
            separatorBuilder: (context, index) {
              return DottedLine(height: 30);
            },
          );
        },
      ),
    );
  }

  // Build a single event item row
  Widget _buildEventItem(List<PenaltyEventModel> events, int order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left player details
        _buildPlayerDetails(events.first, order, isRightSide: false),
        // Order in the middle (only one order for each group)
        _buildOrderCircle(order),
        // Right player details
        _buildPlayerDetails(events.last, order, isRightSide: true),
      ],
    );
  }

  // Build player details (same for left or right side)
  Widget _buildPlayerDetails(PenaltyEventModel event, int order, {required bool isRightSide}) {
    return Row(
      mainAxisAlignment: isRightSide ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        // Event type image
        if (isRightSide) _buildEventTypeImage(event.eventType),
        if (isRightSide) SizedBox(width: 8),

        // Player's image
        CircleAvatar(
          backgroundImage: AssetImage(event.playerImage),
          radius: 18,
        ),
        SizedBox(width: 8),

        // Player's name
        Text(
          event.playerName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),

        // Event type image (for left side)
        if (!isRightSide) SizedBox(width: 8),
        if (!isRightSide) _buildEventTypeImage(event.eventType),
      ],
    );
  }

  // Build order circle widget
  Widget _buildOrderCircle(int order) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
      child: Text(
        "$order",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  // Build event type image (success, missed, etc.)
  Widget _buildEventTypeImage(String eventType) {
    String imagePath;
    switch (eventType) {
      case "missed":
        imagePath = "assets/images/penalty_miss.png";
        break;
      case "success":
        imagePath = "assets/images/penalty_sucess.png";
        break;
      default:
        imagePath = "assets/images/penalty_miss.png";
    }
    return Image.asset(
      imagePath,
      width: 24,
      height: 24,
    );
  }
}
