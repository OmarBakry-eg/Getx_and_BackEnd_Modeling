import 'package:flutter/material.dart';

class GetAuthModel {
  String email, password, passwordConfirm, helper;
  bool isSignUp, spinner, ok;
  GetAuthModel(
      {this.password,
      this.passwordConfirm,
      this.ok = true,
      this.helper = '',
      this.isSignUp = false,
      this.spinner = false,
      this.email});
}
