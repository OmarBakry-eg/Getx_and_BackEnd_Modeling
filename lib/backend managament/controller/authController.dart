import 'package:e_learning/main.dart';
import '../database/local.dart';
import '../model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'urls.dart';

class AuthController {
  static AuthModel authModel = AuthModel();

  static Future authFunc({
    String email,
    String password,
    String username,
    String gender,
    bool login,
  }) async {
    final userData = json.encode(login
        ? Urls.signInMap(email, password)
        : Urls.signUpMap(email, password, username, gender));

    http.Response response = await http.post(
      login ? Urls.loginUrl : Urls.regUrl,
      headers: Urls.myHeaders,
      body: userData,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      authModel = AuthModel.fromJson(json.decode(response.body));
      login
          ? print("LoggedIn token ${[authModel.token, authModel.user.email]}")
          : print("SignUp token ${[authModel.token, authModel.user.email]}");
      DataInLocal.saveInLocal(token: authModel.token);
      Urls.errorMessage = 'no';
      return authModel;
    } else {
      print(jsonDecode(response.body));
      Urls.errorMessage = jsonDecode(response.body).toString();
      print("failed in Auth ${response.statusCode}");
    }
  }
}
