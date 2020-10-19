import 'package:e_learning/view/after_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataInLocal {
  static Future<void> saveInLocal({@required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = 'token';
    final String value = token;
    prefs.setString(key, value);
    print('value was stored');
  }

  static Future<String> readFromLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = 'token';
    final String value = prefs.get(key) ?? 'No value stored';
    print('reading from local , token is : $value');
    return value;
  }

  static Future<void> useValueToNavigate(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = 'token';
    final String value = prefs.get(key) ?? 'No value stored';
    if (value != 'No value stored') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ViewDetails(token: value)));
    }
  }
}
