import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefutils {
  static late SharedPreferences sharedpreferences;
  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return sharedpreferences.setInt(key, value);
    } else if (value is double) {
      return sharedpreferences.setDouble(key, value);
    } else if (value is String) {
      return sharedpreferences.setString(key, value);
    } else {
      return sharedpreferences.setBool(key, value);
    }
  }

  static Object? getData({required String key}) {
    return sharedpreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedpreferences.remove(key);
  }
}
