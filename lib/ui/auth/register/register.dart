import 'package:app1/ui/auth/register/cubit/registerState.dart';
import 'package:app1/ui/utils/dialogUtils.dart';
import 'package:app1/ui/widgets/customwidget.dart';
import 'package:flutter/material.dart';
import 'package:app1/ui/auth/register/cubit/regcubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  static const String routename = "register";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterCubit cubit = RegisterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, Registerstates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          Dialogutils.showLoading(context: context, loadingLabel: "loading");
        } else if (state is RegisterErrorState) {
          Dialogutils.hideLoading(context);
          Dialogutils.showMessage(
              context: context, content: state.errorMessage);
          print('error');
        } else if (state is RegisterSuccessState) {
          Dialogutils.hideLoading(context);
          Dialogutils.showMessage(
              context: context, content: 'register success');
          
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          forceMaterialTransparency: true,
        ),
        backgroundColor: Color(0xff004182),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Image.asset('assets/Group 5.png')),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Full Name',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                CustomTextField(
                    controller: cubit.NameController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter your name ";
                      }
                      return null;
                    },
                    hint: "enter your full name"),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Mobile Number',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                CustomTextField(
                    controller: cubit.MobileController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter your phone number ";
                      }
                      if (text.length != 11) {
                        return "invalid phone number";
                      }
                      return null;
                    },
                    hint: "enter your Mobile Number"),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('E-mail Address',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Form(
                  key: cubit.regformKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                          controller: cubit.EmailController,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "please enter your email ";
                            }
                            final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text);
                            if (!emailValid) {
                              print('Invalid Email');
                            }
                            return null;
                          },
                          hint: " enter your E-mail Address"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Password',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          obscureText: cubit.secure,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    cubit.secure = !cubit.secure;
                                  });
                                },
                                icon: Icon(cubit.secure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.red)),
                              errorMaxLines: 2,
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "enter your password"),
                          controller: cubit.PasswordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return "please enter your password";
                            }
                            if (password.length < 6) {
                              return "password is too short";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('rePassword',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          obscureText: cubit.secure,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    cubit.secure = !cubit.secure;
                                  });
                                },
                                icon: Icon(cubit.secure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.red)),
                              errorMaxLines: 2,
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "enter  repassword"),
                          controller: cubit.rePasswordController,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return "please enter  repassword";
                            }
                            if (password.length < 6) {
                              return "password is too short";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(Size(350, 50)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {
                        cubit.register();
                      },
                      child: Text(
                        'sign up',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff004182),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
