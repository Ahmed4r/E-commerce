import 'package:app1/ui/home/cart/cartScreen.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_viewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomsearchProduct extends StatefulWidget {
  CustomsearchProduct({super.key});

  @override
  State<CustomsearchProduct> createState() => _CustomsearchProductState();
}

class _CustomsearchProductState extends State<CustomsearchProduct> {
  @override
  Widget build(BuildContext context) {
    // Getting the ProductTabViewmodel context for the cart count.
    final productTabViewmodel = ProductTabViewmodel.get(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Logo or Image
          Image.asset(
            'assets/Group 5.png',
            width: 66.w,
            height: 22.h,
            color: Appcolors.primaryColor,
          ),
          SizedBox(height: 6.h),

          // Search Bar and Cart Icon Row
          Row(
            children: [
              // Search Bar
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'What do you search for?',
                    hintStyle: TextStyle(
                      color: Appcolors.searchtextColor,
                      fontSize: 15,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Appcolors.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Cart Icon with Badge showing number of cart items
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Cartscreen.routename);
                },
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    // Cart Icon

                    // Badge for cart count
                    Badge(
                      child: ImageIcon(
                        AssetImage('assets/cart.png'),
                        size: 28.sp,
                        color: Appcolors.primaryColor,
                      ),
                      isLabelVisible: true,
                      label: Text(
                        '${productTabViewmodel.numOfCartItems.toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ], //row
          ),
        ],
      ),
    );
  }
}
