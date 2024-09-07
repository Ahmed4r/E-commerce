import 'package:app1/data/model/signin/SinginResponse.dart';

class Loginstates {}

class LoginErrorState extends Loginstates {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginInitalState extends Loginstates {}

class LoginSuccessState extends Loginstates {
  SinginResponse response;
  LoginSuccessState({required this.response});

}

class LoginLoadingState extends Loginstates {}
