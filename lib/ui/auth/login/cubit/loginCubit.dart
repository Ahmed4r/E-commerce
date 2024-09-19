import 'package:app1/data/api_manager.dart';
import 'package:app1/ui/auth/login/cubit/loginStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logincubit extends Cubit<Loginstates> {
  Logincubit() : super(LoginInitalState());
  final loginformKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'ahmedrady03@gmail.com');
  final PasswordController = TextEditingController(text: 'Ahmed@1234');
  bool secure = true;

  // todo : hold data - handle logic

  void login() async {
    if (loginformKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
            nameController.text, PasswordController.text);
        print(response);
        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
          print('error');
        } else {
          emit(LoginSuccessState(response: response));
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
        print('catch');
      }
    }
  }
}
