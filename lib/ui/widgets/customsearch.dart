import 'package:app1/ui/utils/appTheme.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customsearch extends StatelessWidget {
  const Customsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/Group 5.png',
            width: 66,
            height: 22,
            color: Appcolors.primaryColor,
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'what do you search for?',
                hintStyle:
                    TextStyle(color: Appcolors.searchtextColor, fontSize: 20),
                prefixIcon: Icon(
                  Icons.search,
                  size: 35,
                  color: Appcolors.primaryColor,
                ),
              ))),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Appcolors.primaryColor,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
