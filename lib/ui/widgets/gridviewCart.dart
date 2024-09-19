import 'package:app1/data/model/productTab/ProductResponse.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_viewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class gridviewCart extends StatelessWidget {
  bool iswhishlisted = false;
  Data data;
  gridviewCart({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Appcolors.primaryColor, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  '${data.imageCover}',
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 228.h,
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      color: Appcolors.primaryColor,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: iswhishlisted == true
                          ? Icon(Icons.favorite_rounded)
                          : Icon(Icons.favorite_border_outlined),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              data.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14.sp,
                  color: Appcolors.searchtextColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Text(
                  'EGP ${data.price}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: Appcolors.searchtextColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                Text('${data.ratingsAverage}',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: Appcolors.searchtextColor,
                        fontWeight: FontWeight.w500)),
                Icon(Icons.star),
                Spacer(
                  flex: 1,
                ),
                InkWell(
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: Appcolors.primaryColor,
                  ),
                  onTap: () {
                    ProductTabViewmodel.get(context).addToCart(data.id ?? '');
                  },
                  splashColor: Colors.transparent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
