import 'package:app1/data/Failures.dart';

import 'package:app1/data/model/wichlist/getwichlist.dart';

abstract class Wichliststates {}

class GetWishlistInitstates extends Wichliststates {}

class GetWishlistLoadingtstates extends Wichliststates {}

class GetWishlisttSuccessstates extends Wichliststates {
  getWichListResponse response;
  GetWishlisttSuccessstates({required this.response});
}

class GetWishlistErrortstates extends Wichliststates {
  Failures failures;
  GetWishlistErrortstates({required this.failures});
}
