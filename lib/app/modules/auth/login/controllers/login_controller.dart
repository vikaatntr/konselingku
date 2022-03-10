import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class LoginController extends GetxController {
  final AppController _appController = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _showPassword = false.obs;
  get showPassword => _showPassword.value;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
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
      await _appController.getUserData();
      if (_appController.userData!.role == '3') {
        Get.offAllNamed(Routes.ADMIN_HOME);
      } else {
        if (result.user!.emailVerified) {
          if (_appController.userData!.isAccept) {
            _appController.getRoutesByRole(_appController.userData!.role);
          } else {
            Get.back();
            Get.snackbar("Oops!", "Pendaftaran belum di setujui Admin",
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
                backgroundColor: Colors.red);
          }
        } else {
          Get.back();
          Get.toNamed(Routes.VERIFIKASI);
        }
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar("Oops!", e.code);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
