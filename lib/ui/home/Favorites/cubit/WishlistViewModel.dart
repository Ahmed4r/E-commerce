import 'package:app1/data/api_manager.dart';
import 'package:app1/data/model/wichlist/getwichlist.dart';
import 'package:app1/ui/home/Favorites/cubit/WishlistStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlistviewmodel extends Cubit<Wichliststates> {
  Wishlistviewmodel() : super(GetWishlistInitstates());
  List<WichListData> wichlistdata = [];

  void getwichList() async {
    emit(GetWishlistLoadingtstates());
    var either = await ApiManager.getWichlist();
    either.fold((l) => emit(GetWishlistErrortstates(failures: l)), (response) {
      // wichlist = response.data!.products ?? [];
      wichlistdata = response.data ?? [];
      emit(GetWishlisttSuccessstates(response: response));
    });
  }
}
