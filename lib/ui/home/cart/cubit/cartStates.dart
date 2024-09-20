import 'package:app1/data/Failures.dart';
import 'package:app1/data/model/GetFromCart/GetCart.dart';

abstract class CartStates {}

class GetCartInitialStates extends CartStates {}

class GetCartLoadingStates extends CartStates {}

class GetCartErrorStates extends CartStates {
  Failures failures;
  GetCartErrorStates({required this.failures});
}

class GetCartSuccessStates extends CartStates {
  GetCartResponse getCartResponse;
  GetCartSuccessStates({required this.getCartResponse});
}

class DeleteItemInCartInitialStates extends CartStates {}

class DeleteItemInCartLoadingStates extends CartStates {}

class DeleteItemInCartErrorStates extends CartStates {
  Failures failures;
  DeleteItemInCartErrorStates({required this.failures});
}

class DeleteItemInCartSuccessStates extends CartStates {
  GetCartResponse getCartResponse;
  DeleteItemInCartSuccessStates({required this.getCartResponse});
}

class UpdateCountInCartInitialStates extends CartStates {}

class UpdateCountInCartLoadingStates extends CartStates {}

class UpdateCountInCartErrorStates extends CartStates {
  Failures failures;
  UpdateCountInCartErrorStates({required this.failures});
}

class UpdateCountInCartSuccessStates extends CartStates {
  GetCartResponse getCartResponse;
  UpdateCountInCartSuccessStates({required this.getCartResponse});
}
