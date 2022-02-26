import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class LoginController extends GetxController {
  final AppController _appController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _showPassword = false.obs;
  get showPassword => _showPassword.value;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  passwordToggle() {
    _showPassword.value = !_showPassword.value;
  }

  Future<void> login() async {
    CustomDialog.loadingDialog();
    try {
      var result = await _appController.auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (result.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.back();
        Get.toNamed(Routes.VERIFIKASI);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar("Oops!", e.code);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
