import 'package:app1/data/model/category/CategoryOrBrandResponse.dart';
import 'package:app1/ui/home/cubit/hometabStates.dart';
import 'package:app1/ui/home/cubit/hometabViewModel.dart';
import 'package:app1/ui/widgets/announc.dart';
import 'package:app1/ui/widgets/categoriesorBrand_section.dart';
import 'package:app1/ui/widgets/customsearch.dart';

import 'package:app1/ui/widgets/gridviewCat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometab extends StatefulWidget {
  static const String routename = 'hometab';

  @override
  State<Hometab> createState() => _HometabState();
}

class _HometabState extends State<Hometab> {
  Hometabviewmodel viewmodel = Hometabviewmodel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Hometabviewmodel, HomeScreenstates>(
      bloc: viewmodel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customsearch(),
                    Announc(),
                    SizedBox(
                      height: 24.h,
                    ),
                    RowsectiobWidget(name: 'Categories'),
                    SizedBox(
                      height: 24.h,
                    ),
                    state is HomeTabLoadingState
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomCategoriesGridView(
                            list: viewmodel.categoryList,
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RowsectiobWidget(name: 'Brands'),
                    CustomCategoriesGridView(list: viewmodel.brandslist),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
