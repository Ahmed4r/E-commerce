import 'package:app1/data/Failures.dart';
import 'package:app1/data/model/AddToCart/AddToCartResponse.dart';
import 'package:app1/data/model/productTab/ProductResponse.dart';
import 'package:app1/data/model/wichlist/addtowichlistResponse.dart';
import 'package:app1/data/model/wichlist/getwichlist.dart';

abstract class ProductTabStates {}

class ProductListTabInitialState extends ProductTabStates {}

class ProductListTabLoadingState extends ProductTabStates {}

class ProductListTabErrorState extends ProductTabStates {
  String errorMessage;
  ProductListTabErrorState({required this.errorMessage});
}

class ProductListTabSuccessState extends ProductTabStates {
  ProductResponse productResponse;
  ProductListTabSuccessState({required this.productResponse});
}

class CartInitStates extends ProductTabStates {}

class AddCartLoadingStates extends ProductTabStates {}

class AddCartSuccessStates extends ProductTabStates {
  AddToCartResponse cartResponse;

  AddCartSuccessStates(this.cartResponse);
}

class AddCartErrorStates extends ProductTabStates {
  
  Failures failures;
  AddCartErrorStates({required this.failures});
}

class AddWichlisInittstates extends ProductTabStates {}

class AddWichlisLoadingtstates extends ProductTabStates {}

class AddWichlistSuccessstates extends ProductTabStates {
  AddtoWichListResponse response;
  AddWichlistSuccessstates({required this.response});
}

class AddWichlisErrortstates extends ProductTabStates {
  Failures failures;
  AddWichlisErrortstates({required this.failures});
}
