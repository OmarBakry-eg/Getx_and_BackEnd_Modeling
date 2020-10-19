import 'package:e_learning/backend managament/controller/authController.dart';
import 'package:e_learning/backend managament/controller/urls.dart';
import 'package:e_learning/view/after_auth.dart';
import 'package:e_learning/state managament/model/authModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../consts.dart';

class AuthInAction extends GetxController {
  final Rx<GetAuthModel> authModeling = GetAuthModel().obs;
  typing(String confirm) {
    if (confirm != authModeling.value.password) {
      authModeling.update((val) {
        val.ok = false;
      });
    } else {
      authModeling.update((val) {
        val.passwordConfirm = confirm;
      });
      Get.snackbar('Done', 'ok', snackPosition: SnackPosition.BOTTOM);
      authModeling.update((val) {
        val.ok = true;
      });
    }
  }

  login(BuildContext context) async {
    authModeling.update((val) {
      val.spinner = true;
    });
    await AuthController.authFunc(
      email: authModeling.value.email,
      password: authModeling.value.password,
      login: true,
    );
    print('validate');
    authModeling.update((val) {
      val.spinner = false;
    });
    Urls.errorMessage == 'no'
        ? Get.offAll(ViewDetails(token: AuthController.authModel.token))
        : errorWhileSignUp(Urls.errorMessage, context);
  }

  chooseMode(AnimationController animationController) {
    if (authModeling.value.isSignUp == true) {
      authModeling.update((val) {
        val.isSignUp = false;
      });
      animationController.reverse();
    } else {
      authModeling.update((val) {
        val.isSignUp = true;
      });

      animationController.forward();
    }
  }
}
