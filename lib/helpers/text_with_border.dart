import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {
  final String text;

  const TextWithBorder({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        right: 8,
        left: 8,
        bottom: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.grey, // Background color
        border: Border.all(
          color: Colors.grey,
          width: 2, // Border width
        ),
        borderRadius: BorderRadius.circular(20), // Border radius
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w400,// Text color for contrast
        ),
      ),
    );
  }
}