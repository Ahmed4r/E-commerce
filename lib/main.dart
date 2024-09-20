import 'package:app1/mybloc_observer.dart';
import 'package:app1/ui/auth/login/cubit/loginCubit.dart';
import 'package:app1/ui/auth/register/cubit/regcubit.dart';
import 'package:app1/ui/home/cart/cartScreen.dart';

import 'package:app1/ui/home/homepage.dart';
import 'package:app1/ui/auth/login/login.dart';
import 'package:app1/ui/auth/register/register.dart';
import 'package:app1/ui/home/productDeatils/product_details.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_viewmodel.dart';
import 'package:app1/ui/splashscreen/splashScreen.dart';
import 'package:app1/ui/utils/sharedPrefUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myapp extends StatelessWidget {
  String route;
  myapp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: route,
        routes: {
          Splashscreen.routename: (context) => const Splashscreen(),
          Login.routename: (context) => BlocProvider(
                create: (context) => Logincubit(),
                child: Login(),
              ),
          Register.routename: (context) => BlocProvider(
                create: (context) => RegisterCubit(),
                child: Register(),
              ),
          Homepage.routeName: (context) => Homepage(),
          ProductDetails.routename: (context) => ProductDetails(),
          Cartscreen.routename: (context) => Cartscreen()
        },
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Sharedprefutils.init();
  String route;
  var token = Sharedprefutils.getData(key: 'token');
  if (token == null) {
    route = Login.routename;
  } else {
    route = Homepage.routeName;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductTabViewmodel(),
        ),
      ],
      child: myapp(
        route: route,
      )));
}
