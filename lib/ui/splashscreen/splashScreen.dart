import 'package:app1/ui/auth/login/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  static const String routename = "splash_Screen";
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacementNamed(context, Login.routename);
      },
    );
  }

  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Splash_Screen.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
