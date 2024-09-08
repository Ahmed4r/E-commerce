import 'package:app1/ui/home/FavoriteTab.dart';
import 'package:app1/ui/home/Hometab.dart';
import 'package:app1/ui/home/ProfileTab.dart';
import 'package:app1/ui/home/product_list_tab.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/widgets/customNavbotBar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static const String routeName = "homepage";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    Hometab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.whiteColor,
      bottomNavigationBar: Customnavbotbar(
        context: context,
        selectedIndex: selectedIndex,
        onTapFunction: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      body: tabs[selectedIndex],
    );

    
  }

}
