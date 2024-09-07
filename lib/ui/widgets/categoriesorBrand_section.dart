import 'package:app1/main.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowsectiobWidget extends StatelessWidget {
  String name;
  RowsectiobWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Appcolors.primaryColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        InkWell(
            onTap: () {},
            child: Text(
              'View All',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Appcolors.primaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
