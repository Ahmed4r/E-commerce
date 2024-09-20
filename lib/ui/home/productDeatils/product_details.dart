import 'package:app1/data/model/GetFromCart/GetCart.dart';
import 'package:app1/data/model/productTab/ProductResponse.dart';
import 'package:app1/ui/home/cart/cartScreen.dart';
import 'package:app1/ui/home/cart/cubit/cartviewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/widgets/colorWidget.dart';
import 'package:app1/ui/widgets/sizedWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  static const String routename = 'details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Cartviewmodel viewmodel = Cartviewmodel();
  int counter = 0;

  void increaseCount() {
    setState(() {
      counter++;
    });
  }

  void decreaseCount() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  void toogleCheck(ispicked) {
    setState(() {
      ispicked = !ispicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product details'),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20.sp,
            color: Appcolors.primaryColor,
            fontWeight: FontWeight.bold),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageSlideshow(
                children: args.images!.map(
              (e) {
                return Image.network(e);
              },
            ).toList()),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${args.title ?? ''}',
                    // productEntity.title ?? "",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: const Color(0xff06004F)),
                  ),
                ),
                const Spacer(),
                Text(
                  'EGP ${args.price}',
                  // productEntity.price.toString(),
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xff06004F)),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  height: 34.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                          width: 1.h,
                          color: const Color(0xff004182).withOpacity(.3))),
                  child: Center(
                    child: Text(
                      '${'sold'}  ${args.sold}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0xff06004F)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Icon(
                  Icons.star,
                  color: const Color(0xffFDD835),
                  size: 35.h,
                ),
                Text(
                  '${args.ratingsAverage}(${args.ratingsQuantity})',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: const Color(0xff06004F)),
                ),
                SizedBox(
                  width: 66.w,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: const Color(0xff004182),
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            decreaseCount();
                          },
                          child: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(11.r)),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${counter}',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            increaseCount();
                          },
                          child: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(11.r)),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: Container(
                width: 300.w,
                height: 200.h,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff06004F)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      ReadMoreText(
                        '${args.description}',
                        trimMode: TrimMode.Line,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text("Sized"),
                      Row(
                        children: [
                          Sizedwidget(
                            text: '38',
                          ),
                          Sizedwidget(text: '39'),
                          Sizedwidget(text: '40'),
                          Sizedwidget(
                            text: '41',
                          ),
                          Sizedwidget(
                            text: '42',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Colorwidget(
                            color: Colors.black,
                          ),
                          Colorwidget(color: Colors.red),
                          Colorwidget(color: Colors.blueAccent),
                          Colorwidget(color: Colors.green),
                          Colorwidget(color: Colors.redAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 160.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text('Total Price',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: const Color(0xff06004F).withOpacity(.6))),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'EGP ${args.price}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: const Color(0xff06004F)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          backgroundColor: const Color(0xff004182),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 32.w)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Cartscreen.routename);
                              },
                              child: Icon(Icons.add_shopping_cart_outlined)),
                          SizedBox(
                            width: 26.w,
                          ),
                          Text(
                            'Add to cart',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Colors.white),
                          )
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
