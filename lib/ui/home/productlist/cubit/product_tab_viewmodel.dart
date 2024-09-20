import 'package:app1/data/api_manager.dart';
import 'package:app1/data/model/productTab/ProductResponse.dart';
import 'package:app1/ui/home/Favorites/cubit/WishlistStates.dart';
import 'package:app1/ui/home/productlist/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTabViewmodel extends Cubit<ProductTabStates> {
  ProductTabViewmodel() : super(ProductListTabInitialState());
  List<Data> ProductList = [];
  int numOfCartItems = 0;
  static ProductTabViewmodel get(context) => BlocProvider.of(context);

  void addToCart(String productId) async {
    emit(AddCartLoadingStates());
    var either = await ApiManager.addCartData(productId);
    either.fold((error) => emit(AddCartErrorStates(failures: error)),
        (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('num of cart itmes : ${numOfCartItems}');
      emit(AddCartSuccessStates(response));
    });
  }

  void addToWichlist(String productId) async {
    emit(AddWichlisLoadingtstates());
    var either = await ApiManager.addWishlist(productId);
    either.fold((error) => emit(AddWichlisErrortstates(failures: error)),
        (response) {
      print('num of cart itmes : ${numOfCartItems}');
      emit(AddWichlistSuccessstates(response: response));
    });
  }

  void getAllProducts() async {
    try {
      emit(ProductListTabLoadingState());
      ApiManager.getAllProducts();
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail ') {
        emit(ProductListTabErrorState(errorMessage: "Error happend"));
      } else {
        ProductList = response.data ?? [];
        emit(ProductListTabSuccessState(productResponse: response));
      }
    } catch (e) {
      emit(ProductListTabErrorState(errorMessage: e.toString()));
    }
  }
}
