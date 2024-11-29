import 'package:aina_michael_3scorers/screen/match_details.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final VoidCallback? onTap;  // Adding onTap as a parameter

  const CustomCard({super.key, this.onTap});  // onTap passed in the constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>MatchDetails()
        )
        );
      },  // Trigger the callback when tapped
      child: Container(
        width: 398.08,
        height: 132,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Green top container with text
            Container(
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
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/logs.png", // Logo path
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "LaLiga",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Game Week 15",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Main content area
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/54.png", height: 20, width: 20),
                      SizedBox(height: 4),
                      Text("Barcelona", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("May 21, 2024", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xff828282))),
                      SizedBox(height: 1),
                      Text("3 - 3", style: TextStyle(fontSize: 18, color: Color(0xff000000))),
                      SizedBox(height: 1),
                      Text("Full-time", style: TextStyle(fontSize: 11, color: Color(0xff828282))),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/giros.png", height: 20, width: 20),
                      SizedBox(height: 4),
                      Text("Girona"),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
