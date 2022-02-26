import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class ForgotPasswordController extends GetxController {
  final AppController _appController = Get.find();
  TextEditingController emailController = TextEditingController();
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
  }

  onSend() async {
    CustomDialog.loadingDialog();
    try {
      await _appController.auth
          .sendPasswordResetEmail(email: emailController.text);
      Get.back();
      Get.snackbar("Sukses!", "Cek emailmu");
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar("Oops!", e.code);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
