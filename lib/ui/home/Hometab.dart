import 'package:app1/main.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/widgets/announc.dart';
import 'package:app1/ui/widgets/categoriesorBrand_section.dart';
import 'package:app1/ui/widgets/customsearch.dart';
import 'package:app1/ui/widgets/gridviewCat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometab extends StatelessWidget {
  static const String routename = 'hometab';
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Customsearch(),
            Announc(),
            SizedBox(
              height: 24.h,
            ),
            RowsectiobWidget(name: 'Categories'),
            CustomCategoriesGridView(),
            RowsectiobWidget(name: 'Brands'),
            CustomCategoriesGridView(),
          ]),
        ),
      ),
    );
  }
}
