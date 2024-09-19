import 'package:app1/ui/home/productDeatils/product_details.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_states.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_viewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/widgets/customsearchProduct.dart';
import 'package:app1/ui/widgets/gridviewCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductTabViewmodel viewmodel = ProductTabViewmodel();
  ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewmodel, ProductTabStates>(
      bloc: viewmodel..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomsearchProduct(),
                SizedBox(
                  height: 24.h,
                ),
                viewmodel.ProductList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.primaryColor,
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                        itemCount: viewmodel.ProductList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 4,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h),
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ProductDetails.routename,
                                  arguments: viewmodel.ProductList[index]);
                            },
                            child: gridviewCart(
                                data: viewmodel.ProductList[index]),
                          );
                        },
                      ))
              ],
            ),
          ),
        );
      },
    );
  }
}
