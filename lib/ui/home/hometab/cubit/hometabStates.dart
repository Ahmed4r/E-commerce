import 'package:app1/data/model/category/CategoryOrBrandResponse.dart';

abstract class HomeScreenstates {}

class HomeTabInitalState extends HomeScreenstates {}
class HomeTabLoadingState extends HomeScreenstates {}

class HometabErrostates extends HomeScreenstates {
  String errorMessage;
  HometabErrostates({required this.errorMessage});
}

class HometabSuccessStates extends HomeScreenstates {
  CategoryOrBrandResponse response;
  HometabSuccessStates({required this.response});
}
