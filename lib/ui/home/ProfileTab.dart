import 'package:app1/ui/auth/login/login.dart';
import 'package:app1/ui/utils/appcolors.dart';
import 'package:app1/ui/utils/sharedPrefUtils.dart';
import 'package:app1/ui/widgets/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  static const String routeName = 'RegisterPage';
  TextEditingController nameController =
      TextEditingController(text: 'ahmed Rady');
  TextEditingController EmailController =
      TextEditingController(text: 'ahmedrady03@gmail.com');
  TextEditingController PasswordController =
      TextEditingController(text: '123456');
  TextEditingController MobileController =
      TextEditingController(text: '01091541856');
  TextEditingController addressController =
      TextEditingController(text: 'Baltim');

  var formKey = GlobalKey<FormState>();
  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                'assets/Group 5.png',
                scale: 2,
                color: Appcolors.primaryColor,
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welome,name',
                        style: Theme.of(context).textTheme.titleLarge),
                    Text('show email ',
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Your Full Name',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Appcolors.primaryColor),
                      ),
                    ),
                    Customtextform(
                      securedText: false,
                      keyboardType: TextInputType.name,
                      label: 'UserName',
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Your E-mail',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Appcolors.primaryColor),
                      ),
                    ),
                    Customtextform(
                      securedText: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: EmailController,
                      label: "Email",
                      validator: (email) {
                        if (email == null || email.trim().isEmpty) {
                          return 'Please enter your Email';
                        }

                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email);
                        if (!emailValid) {
                          print('Invalid Email');
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Your Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Appcolors.primaryColor),
                      ),
                    ),
                    Customtextform(
                      keyboardType: TextInputType.phone,
                      securedText: true,
                      controller: PasswordController,
                      label: "Password",
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter your Password';
                        }
                        if (text.length < 6) {
                          return "Password must be at least 6 chars";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Your Mobile Number',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Appcolors.primaryColor),
                      ),
                    ),
                    Customtextform(
                      keyboardType: TextInputType.number,
                      securedText: false,
                      controller: PasswordController,
                      label: "Your Mobile Number",
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Your Mobile Number';
                        }
                        if (text.length <= 11) {
                          return "phone number must be at least 11 number";
                        }

                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Your address',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Appcolors.primaryColor),
                      ),
                    ),
                    Customtextform(
                      keyboardType: TextInputType.number,
                      securedText: false,
                      controller: addressController,
                      label: "Your address",
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Your address';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
