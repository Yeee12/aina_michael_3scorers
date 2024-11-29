import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabs; // Titles for the tabs
  final int initialIndex; // Default active tab
  final ValueChanged<int> onTabSelected; // Callback for tab selection

  CustomTabBar({
    required this.tabs,
    this.initialIndex = 0, // Default to the first tab
    required this.onTabSelected,
  });

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int _activeTabIndex; // Tracks the currently active tab

  @override
  void initState() {
    super.initState();
    _activeTabIndex = widget.initialIndex; // Initialize with the provided index
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.tabs.map((tab) {
        int index = widget.tabs.indexOf(tab);
        return _buildTab(tab, index);
      }).toList(),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isActive = index == _activeTabIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _activeTabIndex = index; // Update the active tab
        });
        widget.onTabSelected(index); // Trigger the callback with the selected index
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isActive ? Colors.white : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 130,
              color: Colors.green,
            ),
        ],
      ),
    );
  }
}
