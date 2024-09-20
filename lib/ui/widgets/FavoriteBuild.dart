import 'package:app1/data/model/wichlist/getwichlist.dart';
import 'package:app1/ui/home/Favorites/cubit/WishlistViewModel.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_viewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Favoritebuild extends StatefulWidget {
  final WichListData wichListdata;

  Favoritebuild({required this.wichListdata});

  @override
  State<Favoritebuild> createState() => _CartItemState();
}

class _CartItemState extends State<Favoritebuild> {
  final Wishlistviewmodel viewmodel = Wishlistviewmodel();
  ProductTabViewmodel viewmodel1 = ProductTabViewmodel();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 150.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0x4C004182)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 120.w,
            height: 113.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.wichListdata.imageCover ?? ""),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(width: 28.w),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.wichListdata.title?.substring(0, 8) ??
                            "No Title",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Color(0xFF06004E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Appcolors.primaryColor,
                      ),
                    ),
                  ],
                ),

                // Color Display
                Text("Black Color"),

                // Price and Add to Cart Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EGP ${widget.wichListdata.price ?? 0}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 16.sp),
                    ),
                    Container(
                      // height: 60,

                      decoration: BoxDecoration(
                        color: const Color(0xff004182),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        onPressed: () {
                          // Implement add to cart logic
                          viewmodel1.addToCart(widget.wichListdata.id ?? '');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
