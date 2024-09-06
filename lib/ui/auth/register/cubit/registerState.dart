import 'package:app1/data/model/RegisterResponse.dart';

abstract class Registerstates {}

class RegisterInitialgState extends Registerstates {}

class RegisterLoadingState extends Registerstates {}

class RegisterErrorState extends Registerstates {
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends Registerstates {
  RegisterResponse response;
  RegisterSuccessState({required this.response});
}
