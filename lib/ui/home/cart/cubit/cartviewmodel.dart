import 'package:app1/data/api_manager.dart';
import 'package:app1/data/model/GetFromCart/GetCart.dart';
import 'package:app1/ui/home/cart/cubit/cartStates.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartviewmodel extends Cubit<CartStates> {
  Cartviewmodel() : super(GetCartInitialStates());
  List<GetProductCart> productList = [];

  void getCart() async {
    emit(GetCartLoadingStates(
    
    ));
    var either = await ApiManager.getCart();
    either.fold((l) => emit(GetCartErrorStates(failures: l)), (response) {
      productList = response.data!.products ?? [];
      emit(GetCartSuccessStates(getCartResponse: response));
    });
  }
}
