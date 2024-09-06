import 'package:app1/data/api_manager.dart';
import 'package:app1/ui/auth/register/cubit/registerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<Registerstates> {
  RegisterCubit() : super(RegisterInitialgState());
  final regformKey = GlobalKey<FormState>();
  final NameController =
      TextEditingController(text: "Ahmed Abd Al-Muti2211111");
  final MobileController = TextEditingController(text: "01010700701");
  final EmailController =
      TextEditingController(text: "ahmedmuti122221@gmail.com");
  final PasswordController = TextEditingController(text: "Ahmed@123");
  final rePasswordController = TextEditingController(text: "Ahmed@123");
  bool secure = true;

  //todo: hold data - handle logic

  void register() async {
    if (regformKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState());
        var response = await ApiManager.register(
            NameController.text,
            EmailController.text,
            PasswordController.text,
            rePasswordController.text,
            MobileController.text);
        print(response);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMessage: response.message!));
          print(response.message);
          print('fail');
        } else {
          emit(RegisterSuccessState(response: response));
          print('error2');
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
        print('cat');
      }
    }
  }
}
