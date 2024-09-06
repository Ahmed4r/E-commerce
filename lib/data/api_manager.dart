import 'dart:convert';
import 'package:app1/data/model/RegisterRequest.dart';
import 'package:app1/data/model/RegisterResponse.dart';
import 'package:app1/data/EndPoints.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // https://ecommerce.routemisr.com/api/v1/auth/signup
  static const String baseUrl = 'ecommerce.routemisr.com';

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
      // return RegisterResponse.fromJson(jsonEncode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
