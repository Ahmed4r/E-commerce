import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app1/data/model/GetFromCart/GetCart.dart';

class CartItem extends StatelessWidget {
  final GetProductCart productCart;

  CartItem({required this.productCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 160.h, // Adjusted height for better spacing
      margin: EdgeInsets.symmetric(vertical: 10.h), // Added vertical margin
      padding: EdgeInsets.all(12.w), // Added padding for content
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white, // Added background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // Product Image Section
          Container(
            width: 120.w,
            height: 113.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(
              productCart.product?.imageCover ?? '',
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w), // Space between image and content

          // Product Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Product Title and Delete Icon Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        productCart.product?.title ?? "",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF06004E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add your delete logic here
                        // Cartviewmodel.get(context).deleteItem(productCart.product?.id ?? "");
                      },
                      icon: Icon(Icons.delete, color: Appcolors.primaryColor),
                    ),
                  ],
                ),

                // Count Information
                Text(
                  "Quantity: ${productCart.count ?? 0}",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),

                // Price and Quantity Controls Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${productCart.price ?? 0} EGP",
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff004182),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        children: [
                          // Decrease Quantity Button
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              // Decrease quantity logic here
                              // int counter = productCart.count ?? 0;
                              // counter--;
                              // CartCubit.get(context).update(productCart.product?.id ?? "", counter);
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          // Display Quantity
                          Text(
                            '${productCart.product!.quantity}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          // Increase Quantity Button
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {
                              // Increase quantity logic here
                              // int counter = productCart.quantity ?? 0;
                              // counter++;
                              // CartCubit.get(context).update(productCart.product?.id ?? "", counter);
                            },
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
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
