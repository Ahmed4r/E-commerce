import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';

class Customnavbotbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTapFunction;
  Customnavbotbar({
    required this.onTapFunction,
    required BuildContext context,
    required this.selectedIndex, // Initialize the selectedIndex field
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0
                  ? Appcolors.primaryColor
                  : Appcolors.whiteColor,
              backgroundColor: selectedIndex == 0
                  ? Appcolors.whiteColor
                  : Colors.transparent,
              radius: 20,
              child: ImageIcon(
                size: 40,
                AssetImage('assets/homepage.png'),
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? Appcolors.primaryColor
                  : Appcolors.whiteColor,
              backgroundColor: selectedIndex == 1
                  ? Appcolors.whiteColor
                  : Colors.transparent,
              radius: 20,
              child: ImageIcon(
                size: 40,
                AssetImage('assets/categories.png'),
              ),
            ),
            label: "categ",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? Appcolors.primaryColor
                  : Appcolors.whiteColor,
              backgroundColor: selectedIndex == 2
                  ? Appcolors.whiteColor
                  : Colors.transparent,
              radius: 20,
              child: ImageIcon(
                size: 40,
                AssetImage('assets/favorites.png'),
              ),
            ),
            label: "fav",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3
                  ? Appcolors.primaryColor
                  : Appcolors.whiteColor,
              backgroundColor: selectedIndex == 3
                  ? Appcolors.whiteColor
                  : Colors.transparent,
              radius: 20,
              child: ImageIcon(
                size: 40,
                AssetImage('assets/profile.png'),
              ),
            ),
            label: "profile",
          ),
          // Add more BottomNavigationBarItems here if needed
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Appcolors.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onTapFunction,
      ),
    );
  }
}
