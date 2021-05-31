import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({@required String key, @required bool value}) {
    return sharedPreferences.setBool(key, value);
  }

  static getData({
    @required String key,
  }) {
    return sharedPreferences.getBool(
      key,
    );
  }
}
