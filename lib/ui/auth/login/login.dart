import 'package:app1/ui/homepage.dart';
import 'package:app1/ui/widgets/customwidget.dart';
import 'package:app1/ui/auth/register/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routename = "login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginformKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final PasswordController = TextEditingController();
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      backgroundColor: Color(0xff004182),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/Group 5.png')),
          SizedBox(
            height: 40,
          ),
          Text(
            "Welcome Back to route",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Please sign in with your mail",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(
            height: 70,
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
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Form(
                    key: loginformKey,
                    child: CustomTextField(
                      controller: nameController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "please enter your name ";
                        }
                        return null;
                      },
                      hint: "enter your name",
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    obscureText: secure,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          icon: Icon(
                              secure ? Icons.visibility_off : Icons.visibility),
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
                    controller: PasswordController,
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
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Forgot password ?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: WidgetStateProperty.all(Size(350, 50)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)))),
                      onPressed: () {
                        if (loginformKey.currentState?.validate() ?? false) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const Homepage(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dont have an account ? ',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Register.routename);
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
