mixin Urls {
  static const String regUrl =
      "https://e-learning-back.herokuapp.com/api/v1/signup";
  static const String loginUrl =
      "https://e-learning-back.herokuapp.com/api/v1/login";
  static const Map<String, String> myHeaders = {
    "Content-Type": "application/json",
  };

  static Map<String, dynamic> signUpMap(email, password, username, gender) => {
        "email": email,
        "password": password,
        "username": username,
        "gender": gender
      };
  static Map<String, dynamic> signInMap(email, password) => {
        "email": email,
        "password": password,
      };

  static String errorMessage = 'no';
}
