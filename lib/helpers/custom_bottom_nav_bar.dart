import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  // The constructor takes the current selected index and the onTap callback
  CustomBottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Ensures all items are visible
      currentIndex: widget.selectedIndex, // Get the active index from props
      selectedItemColor: Colors.green, // Active item color
      unselectedItemColor: Colors.black, // Inactive item color
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 11, // Font size for the selected label
        fontWeight: FontWeight.w500, // Bold font for selected label
        color: Colors.green, // Selected label color
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11, // Font size for the unselected label
        fontWeight: FontWeight.w500, // Normal font weight for unselected
        color: Colors.black, // Unselected label color
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: 'Matches',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 24,  // Set the width of the profile image
            height: 24, // Set the height of the profile image
            child: ClipOval(
              child: Image.asset(
                'assets/images/fantasy.png', // Profile image asset
                fit: BoxFit.cover, // Ensure the image covers the container properly
              ),
            ),
          ),
          label: 'Fantasy',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 24,  // Set the width of the profile image
            height: 24, // Set the height of the profile image
            child: ClipOval(
              child: Image.asset(
                'assets/images/shop.png', // Profile image asset
                fit: BoxFit.cover, // Ensure the image covers the container properly
              ),
            ),
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 24,  // Set the width of the profile image
            height: 24, // Set the height of the profile image
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/image.png'), // Profile image asset
            ),
          ),
          label: 'My Profile',
        ),
      ],
      onTap: widget.onItemTapped, // Use the callback passed from the parent widget
    );
  }
}
