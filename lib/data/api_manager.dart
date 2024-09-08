import 'dart:convert';
import 'package:app1/data/model/category/CategoryOrBrandResponse.dart';
import 'package:app1/data/model/register/RegisterRequest.dart';
import 'package:app1/data/model/register/RegisterResponse.dart';
import 'package:app1/data/EndPoints.dart';
import 'package:app1/data/model/signin/SinginRequest.dart';
import 'package:app1/data/model/signin/SinginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
}
