import 'package:flutter/material.dart';

class HighlightPlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(
        Icons.play_arrow,
        color: Color(0xff008f8f),
        size: 25,
      ),
    );
  }
}
