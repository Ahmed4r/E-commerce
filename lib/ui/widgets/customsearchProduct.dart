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
                    TextStyle(color: Appcolors.searchtextColor, fontSize: 15),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25,
                  color: Appcolors.primaryColor,
                ),
              ))),
              InkWell(
                child: Badge(
                  label: Text(ProductTabViewmodel.get(context)
                      .numOfCartItems
                      .toString()),
                  child: ImageIcon(
                    AssetImage('assets/cart.png'),
                    size: 28.sp,
                    color: Appcolors.primaryColor,
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).pushNamed(cart.routename);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
