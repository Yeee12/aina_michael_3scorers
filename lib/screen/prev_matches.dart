import 'package:aina_michael_3scorers/helpers/custom_bottom_nav_bar.dart';
import 'package:aina_michael_3scorers/helpers/custom_card.dart';
import 'package:aina_michael_3scorers/helpers/custom_tab_bar.dart';
import 'package:aina_michael_3scorers/screen/match_details.dart';
import 'package:flutter/material.dart';
import 'package:aina_michael_3scorers/helpers/league_icon.dart';

class PrevMatches extends StatefulWidget {
  const PrevMatches({super.key});

  @override
  State<PrevMatches> createState() => _PrevMatchesState();
}

class _PrevMatchesState extends State<PrevMatches> {

  int _selectedIndex = 0; // Default active index set to "Home"

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index
    });

    switch (index) {
      case 0:
      // No need to navigate; already on the "Home" screen
        break;
      case 1:
        Navigator.pushNamed(context, '/momentum').then((returnedIndex) {
          if (returnedIndex != null) {
            setState(() {
              // Explicitly cast to int
              _selectedIndex = returnedIndex as int;
            });
          }
        });
        break;
      case 2:
        print("Navigate to Fantasy");
        break;
      case 3:
        print("Navigate to Shop");
        break;
      case 4:
        print("Navigate to My Profile");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(259), // Customize AppBar height
        child: Stack(
          children: [
            // Background Image for the AppBar
            Positioned(
              child: Image.asset(
                "assets/images/Rectangle1.png", // Background image path
                width: 430, // Set the width of the image
                fit: BoxFit.cover,
              ),
            ),
            // Menu Icon (24x24), positioned top: 64, left: 16.2
            Positioned(
              top: 64,
              left: 16.2,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2), // 2px border
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.menu, color: Colors.white, size: 20),
              ),
            ),
            // Logo (60x38), positioned top: 64, left: 185
            Positioned(
              top: 64,
              left: 185,
              child: Image.asset(
                "assets/images/3Scorers.png", // Logo image path
                width: 60,
                height: 38,
              ),
            ),
            // Search TextField with Search Icon (132x34), positioned top: 64, left: 282
            Positioned(
              top: 64,
              left: 282,
              child: Container(
                width: 132,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey, width: 1), // 1px border
                  color: Colors.teal[1000],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.search, color: Colors.white54, size: 18),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none, // Remove the default border
                          ),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Row containing LeagueIcon widgets inside the AppBar
            Positioned(
              top: 134, // Adjust this to control vertical position inside the AppBar
              left: 0,
              right: 0, // Ensures Row is centered horizontally
              child: Column(
                children: [
                  Container(
                    height: 61,
                    width: 430,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          LeagueIcon(
                            label: "All",
                            imagePath: "assets/images/world.png",
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 20), // Adjust spacing between icons
                          LeagueIcon(
                            label: "EPL",
                            imagePath: "assets/images/epl.png",
                            width: 26.5,
                            height: 27,
                          ),
                          SizedBox(width: 20),
                          LeagueIcon(
                            label: "La Liga",
                            imagePath: "assets/images/france.png",
                            width: 27.5,
                            height: 27,
                          ),
                          SizedBox(width: 20),
                          LeagueIcon(
                            label: "Seria A",
                            imagePath: "assets/images/liga.png",
                            width: 25.25,
                            height: 27,
                          ),
                          SizedBox(width: 20),
                          LeagueIcon(
                            label: "Bundesliga",
                            imagePath: "assets/images/bud.png",
                            width: 32.71,
                            height: 26.78,
                          ),
                          SizedBox(width: 20),
                          LeagueIcon(
                            label: "Ligue 1",
                            imagePath: "assets/images/ligaa.png",
                            width: 32.71,
                            height: 26.78,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 215, // Adjust this to control vertical position inside the AppBar
                left: 0,
                right: 0,
                child:   CustomTabBar(
                  tabs: ["Live Matches", "New Matches", "Past Matches"],
                  initialIndex: 2, // Default active tab
                  onTabSelected: (index) {
                    // Handle tab selection
                  },
                ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: CustomCard(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped
      ),
    );
  }
}
