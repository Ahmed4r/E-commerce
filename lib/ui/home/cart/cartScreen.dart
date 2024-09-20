import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app1/data/model/GetFromCart/GetCart.dart';
import 'package:app1/ui/home/cart/cubit/cartStates.dart';
import 'package:app1/ui/home/cart/cubit/cartviewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/widgets/cart_item.dart';

class Cartscreen extends StatelessWidget {
  static const String routename = 'cart';
  final Cartviewmodel viewmodel =
      Cartviewmodel(); // Moved instantiation inside the class

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          viewmodel..getCart(), // Provide Cartviewmodel to BlocProvider
      child: BlocBuilder<Cartviewmodel, CartStates>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: state is GetCartSuccessStates
                ? Container(
                    height: 70.h,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.sp),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'EGP ${state.getCartResponse.data?.totalCartPrice ?? 0}',
                              style: TextStyle(
                                color: Appcolors.primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.primaryColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 12.h),
                          ),
                          onPressed: () {
                            // Add your checkout logic here
                          },
                          child: Text(
                            "Check Out",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        )
                      ],
                    ),
                  )
                : null,
            body: state is GetCartLoadingStates
                ? Center(
                    child:
                        CircularProgressIndicator(), // Show progress indicator while loading
                  )
                : state is GetCartErrorStates
                    ? Center(
                        child: Text(
                          'Error: ${state.failures.errorMessage}', // Display error message if failed
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : state is GetCartSuccessStates
                        ? Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: state.getCartResponse.data
                                          ?.products?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final productCart = state
                                        .getCartResponse.data!.products![index];
                                    return CartItem(productCart: productCart);
                                  },
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Text('No products in the cart'),
                          ),
          );
        },
      ),
    );
  }
}
