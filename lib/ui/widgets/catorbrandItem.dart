import 'package:app1/data/model/category/CategoryOrBrandResponse.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Catorbranditem extends StatefulWidget {
  final CategoryOrBrands list;
  Catorbranditem({required this.list});

  @override
  State<Catorbranditem> createState() => _CatorbranditemState();
}

class _CatorbranditemState extends State<Catorbranditem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Set a fixed height for the image instead of using Expanded
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            imageUrl: widget.list.image ?? '',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        // Use Flexible instead of Expanded for text
        Expanded(
          flex: 8,
          child: Text(
            widget.list.name ?? '',
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Appcolors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
