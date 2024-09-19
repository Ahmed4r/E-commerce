import 'package:app1/data/api_manager.dart';
import 'package:app1/data/model/category/CategoryOrBrandResponse.dart';

import 'package:app1/ui/home/hometab/cubit/hometabStates.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Hometabviewmodel extends Cubit<HomeScreenstates> {
  Hometabviewmodel() : super(HomeTabInitalState());
  List<CategoryOrBrands> categoryList = [];
  List<CategoryOrBrands> brandslist = [];

  //hold data - handl logic

  void getAllCategories() async {
    try {
      emit(HomeTabLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HometabErrostates(errorMessage: response.message!));
        print('error');
      } else {
        categoryList = response.data ?? [];
        emit(HometabSuccessStates(response: response));
        print('done');
      }
    } catch (e) {
      throw (e.toString());
      // print(e);
    }
  }

  void getAllBrands() async {
    try {
      emit(HomeTabLoadingState());
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HometabErrostates(errorMessage: response.message!));
        print('error');
      } else {
        brandslist = response.data ?? [];
        emit(HometabSuccessStates(response: response));
        print('done');
      }
    } catch (e) {
      throw (e.toString());
      // print(e);
    }
  }
}
