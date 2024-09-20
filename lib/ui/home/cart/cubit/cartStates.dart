import 'package:app1/data/Failures.dart';
import 'package:app1/data/model/AddToCart/AddToCartResponse.dart';
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
