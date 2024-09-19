// import 'package:app1/ui/home/cart/cubit/cartStates.dart';
// import 'package:app1/ui/home/cart/cubit/cartviewmodel.dart';
// import 'package:app1/ui/home/productlist/cubit/product_tab_states.dart';
// import 'package:app1/ui/utils/appcolors.dart';
// import 'package:app1/ui/widgets/cart_item.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Cartscreen extends StatelessWidget {
//   const Cartscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
   
//             return Scaffold(
//               bottomNavigationBar: Container(
//                 height: 70.h,
//                 color: Colors.greenAccent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Total Price"),
//                         // Text("${state.cartResponse.data?.totalCartPrice} EGP")
//                       ],
//                     ),
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Appcolors.primaryColor),
//                         onPressed: () {},
//                         child: Text("Check Out"))
//                   ],
//                 ),
//               ),
//               body: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemBuilder: (context, index) {
//                         return CartItem(
//                             state.cartResponse.data!.products![index]);
//                       },
//                       itemCount: 0
//                     ),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
  