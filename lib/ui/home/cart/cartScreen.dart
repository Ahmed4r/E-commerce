import 'package:app1/ui/home/cart/cubit/cartStates.dart';
import 'package:app1/ui/home/cart/cubit/cartviewmodel.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartscreen extends StatelessWidget {
  static const String routename = 'cart';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Cartviewmodel()..getCart(), // Provide Cartviewmodel
      child: BlocBuilder<Cartviewmodel, CartStates>(
        builder: (context, state) {
          if (state is GetCartSuccessStates) {
            return Scaffold(
              bottomNavigationBar: Container(
                height: 70.h,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Price",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        Text(
                          "EGP  ${state.getCartResponse.data!.totalCartPrice}",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.primaryColor,
                      ),
                      onPressed: () {
                        // Handle checkout logic
                      },
                      child: Text(
                        "Check Out",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(
                          productCart: state.getCartResponse.data!
                              .products![index], // Use state data
                        );
                      },
                      itemCount: state.getCartResponse.data!.products!
                          .length, // Use state data
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
