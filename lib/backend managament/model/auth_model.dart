import 'dart:convert';

AuthModel regModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String regModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.token,
    this.user,
  });

  final String token;
  final User user;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.username,
    this.gender,
    this.photo,
    this.email,
    this.enabled,
    this.pushTokens,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String username;
  final String gender;
  final String photo;
  final String email;
  final bool enabled;
  final List<dynamic> pushTokens;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        gender: json["gender"],
        photo: json["photo"],
        email: json["email"],
        enabled: json["enabled"],
        pushTokens: List<dynamic>.from(json["pushTokens"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "gender": gender,
        "photo": photo,
        "email": email,
        "enabled": enabled,
        "pushTokens": List<dynamic>.from(pushTokens.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
