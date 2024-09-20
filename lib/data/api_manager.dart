import 'dart:convert';
import 'package:app1/data/Failures.dart';
import 'package:app1/data/model/AddToCart/AddToCartResponse.dart';
import 'package:app1/data/model/GetFromCart/GetCart.dart';
import 'package:app1/data/model/category/CategoryOrBrandResponse.dart';
import 'package:app1/data/model/productTab/ProductResponse.dart';
import 'package:app1/data/model/register/RegisterRequest.dart';
import 'package:app1/data/model/register/RegisterResponse.dart';
import 'package:app1/data/EndPoints.dart';
import 'package:app1/data/model/signin/SinginRequest.dart';
import 'package:app1/data/model/signin/SinginResponse.dart';
import 'package:app1/ui/utils/sharedPrefUtils.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // https://ecommerce.routemisr.com/api/v1/auth/signup
  static const String baseUrl = 'ecommerce.routemisr.com';

  static Future<SinginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.signin);
    http.post(url);
    SinginRequest signinRequest =
        SinginRequest(email: email, password: password);
    try {
      final response = await http.post(url, body: signinRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SinginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<RegisterResponse> register(String name, String email,
      String password, String rePassword, String phone) async {
    //unendcodepath ==> name of api
    Uri url = Uri.https(baseUrl, EndPoints.signup);
    var registerRequest = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RegisterResponse.fromJson(json);
      // return RegisterResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllCategories() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);
      var response = await http.get(url);
      return CategoryOrBrandResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllBrands() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getAllBrands);
      var response = await http.get(url);
      return CategoryOrBrandResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getAllProductlist);
      var response = await http.get(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<Either<Failures, AddToCartResponse>> addCartData(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);

    try {
      var token = Sharedprefutils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddToCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }
  }

  static Future<Either<Failures, GetCartResponse>> getCart() async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);

    try {
      var token = Sharedprefutils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: 'error'));
    }
  }
}
