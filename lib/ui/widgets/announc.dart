import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Announc extends StatelessWidget {
  List<String> sliderImages = [
    'assets/Property 1=Default.png',
    'assets/Property 1=Variant2.png',
    'assets/Property 1=Variant3.png'
  ];
  Announc({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      children: sliderImages
          .map(
            (url) => Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                  width: 398.h,
                  height: 200,
                )),
          )
          .toList(),
      initialPage: 0,
      indicatorColor: Appcolors.primaryColor,
      indicatorBackgroundColor: Appcolors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
    );
  }
}
