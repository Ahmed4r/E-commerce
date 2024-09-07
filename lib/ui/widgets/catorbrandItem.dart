import 'package:app1/main.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catorbranditem extends StatelessWidget {
  const Catorbranditem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/Ellipse 16.png'),
              radius: 50.r,
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child: Text(
              'name',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Appcolors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            )),
      ],
    );
  }
}
