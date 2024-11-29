import 'package:aina_michael_3scorers/cubits/game_info_cubit.dart';
import 'package:aina_michael_3scorers/cubits/game_info_state.dart';
import 'package:aina_michael_3scorers/models/game_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GameInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameInfoCubit, GameInfoState>(
      builder: (context, state) {
        if (state is GameInfoLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GameInfoLoaded) {
          return _buildGameInfoCard(state.gameInfo);
        } else if (state is GameInfoError) {
          return Center(child: Text(state.error));
        } else {
          return Center(child: Text('No data available'));
        }
      },
    );
  }

  Widget _buildGameInfoCard(GameInformation info) {
    return Container(
      width: 398,
      height: 232,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 16),
          _buildGameDetailRow(Icons.location_on, 'Venue', info.venue),
          _buildGameDetailRow(Icons.calendar_today, 'Date', info.date),
          _buildGameDetailRow(Icons.access_time, 'Time', info.time),
          _buildGameDetailRow(Icons.person, 'Referee', info.referee),
          _buildGameDetailRow(Icons.stadium, 'Stadium Capacity', '${info.stadiumCapacity}'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: 398,
      height: 44,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xff008f8f), // Background color similar to your image
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "Game Information",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildGameDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 14),
          ),
          Spacer(),
          Text(value, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
