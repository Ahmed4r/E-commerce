import 'package:app1/data/api_manager.dart';
import 'package:app1/data/model/GetFromCart/GetCart.dart';
import 'package:app1/ui/home/cart/cubit/cartStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cartviewmodel extends Cubit<CartStates> {
  Cartviewmodel() : super(GetCartInitialStates());
  List<GetProductCart> productList = [];

  void getCart() async {
    emit(GetCartLoadingStates());
    var either = await ApiManager.getCart();
    either.fold((l) => emit(GetCartErrorStates(failures: l)), (response) {
      productList = response.data!.products ?? [];
      emit(GetCartSuccessStates(getCartResponse: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingStates());
    var either = await ApiManager.getCart();
    either.fold((l) => emit(DeleteItemInCartErrorStates(failures: l)),
        (response) {
      productList = response.data!.products ?? [];
      emit(GetCartSuccessStates(getCartResponse: response));
    });
  }

  void updateCartCount(int count, String productId) async {
    emit(UpdateCountInCartLoadingStates());
    var either = await ApiManager.getCart();
    either.fold((l) => emit(UpdateCountInCartErrorStates(failures: l)),
        (response) {
      productList = response.data!.products ?? [];
      emit(UpdateCountInCartSuccessStates(getCartResponse: response));
    });
  }
}
