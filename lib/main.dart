import 'package:app1/ui/auth/register/cubit/regcubit.dart';
import 'package:app1/ui/homepage.dart';
import 'package:app1/ui/auth/login/login.dart';
import 'package:app1/ui/auth/register/register.dart';
import 'package:app1/ui/splashscreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => RegisterCubit(),
        child: Register(),
      ),
      initialRoute: Splashscreen.routename,
      routes: {
        Splashscreen.routename: (context) => const Splashscreen(),
        Login.routename: (context) => const Login(),
        Register.routename: (context) => BlocProvider(
              create: (context) => RegisterCubit(),
              child: Register(),
            ),
        Homepage.routeName: (context) => const Homepage()
      },
    );
  }
}

void main() {
  runApp(const myapp());
}
