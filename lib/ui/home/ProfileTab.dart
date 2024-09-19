import 'package:app1/ui/auth/login/login.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/utils/sharedPrefUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/Group 5.png',
                  scale: 4,
                  color: Appcolors.primaryColor,
                ),
                IconButton(
                    onPressed: () {
                      Sharedprefutils.removeData(key: 'token');
                      Navigator.pushNamed(context, Login.routename);
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Appcolors.primaryColor,
                    )),
              ],
            ),
            Text(
              "Welcome ,Ahmed",
              style: TextStyle(
                  fontSize: 24,
                  color: Appcolors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "email",
              style: TextStyle(fontSize: 16, color: Appcolors.primaryColor),
            ),
            SizedBox(
              height: 70.h,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "User name",
                          style: TextStyle(
                              color: Appcolors.primaryColor, fontSize: 18),
                        ),
                      ),
                    ])),
          ],
        )),
      ),
    );
  }
}
