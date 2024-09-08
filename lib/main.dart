import 'package:app1/mybloc_observer.dart';
import 'package:app1/ui/auth/login/cubit/loginCubit.dart';
import 'package:app1/ui/auth/login/cubit/loginStates.dart';
import 'package:app1/ui/auth/register/cubit/regcubit.dart';
import 'package:app1/ui/home/Hometab.dart';
import 'package:app1/ui/home/homepage.dart';
import 'package:app1/ui/auth/login/login.dart';
import 'package:app1/ui/auth/register/register.dart';
import 'package:app1/ui/splashscreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Homepage.routeName,
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
          Homepage.routeName: (context) => Homepage()
        },
      ),
    );
  }
}

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const myapp());
}
