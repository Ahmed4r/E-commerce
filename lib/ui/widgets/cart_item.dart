import 'package:app1/data/model/GetFromCart/GetCart.dart';
import 'package:app1/ui/home/cart/cubit/cartviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatefulWidget {
  final GetProductCart productCart;

  CartItem({required this.productCart});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  Cartviewmodel viewmodel = Cartviewmodel();
  late int counter;

  @override
  void initState() {
    super.initState();
    // Initialize the counter with the current count from the cart item
    counter = widget.productCart.count ?? 0;
  }

  void _increaseCount() {
    setState(() {
      counter++;
    });
    viewmodel.updateCartCount(counter, widget.productCart.product?.id ?? '');
  }

  void _decreaseCount() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
      viewmodel.updateCartCount(counter, widget.productCart.product?.id ?? '');
    }
  }

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
                image:
                    NetworkImage(widget.productCart.product!.imageCover ?? ""),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50, color: Color(0x4C004182)),
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
                // Title and Delete Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.productCart.product?.title?.substring(0, 8) ?? "",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Color(0xFF06004E),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewmodel.deleteItemInCart(
                            widget.productCart.product?.id ?? '');
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),

                // Count Display
                Text("Count: $counter"),

                // Price and Counter Controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "EGP ${widget.productCart.price}",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 16.sp),
                    ),
                    // Increment/Decrement Counter
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xff004182),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: _decreaseCount,
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            '$counter', // Directly use the updated counter
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(width: 15.w),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: _increaseCount,
                            icon: const Icon(
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
