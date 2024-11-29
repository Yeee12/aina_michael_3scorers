import 'package:flutter/material.dart';

class LeagueIcon extends StatefulWidget {
  final String label;
  final String imagePath;
  final double width;
  final double height;

  const LeagueIcon({
    super.key,
    required this.label,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  _LeagueIconState createState() => _LeagueIconState();
}

class _LeagueIconState extends State<LeagueIcon> {
  bool isPressed = false; // Track if the icon is pressed

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed; // Toggle pressed state
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust padding as needed
        child: Column(
          children: [
            Container(
              width: widget.width + 15, // Add padding to make circle slightly larger than image
              height: widget.height + 15,
              decoration: BoxDecoration(
                color: isPressed ? Colors.green : Colors.black, // Green when pressed, black otherwise
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0), // Optional padding to fit image better
                child: Image.asset(
                  widget.imagePath,
                  width: widget.width,
                  height: widget.height,
                ),
              ),
            ),
            SizedBox(height: 3,),
            Flexible(
              child: Text(
                widget.label,
                style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
