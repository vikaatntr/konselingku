import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class VerifikasiController extends GetxController {
  final AppController _appController = Get.find();
  bool isReload = true;
  @override
  Future<void> onInit() async {
    await _appController.user!.sendEmailVerification();
    getUserVerified();
    super.onInit();
  }

  @override
  void onClose() {
    isReload = false;
  }

  getUserVerified() async {
    await _appController.user!.reload();
    if (_appController.user!.emailVerified) {
      isReload = false;
      await _appController.getUserData();
      switch (_appController.userData!.role) {
        case "0":
          Get.offAllNamed(Routes.USER_HOME);
          break;
        case "1":
          Get.until((route) => Get.currentRoute == Routes.LOGIN);
          break;
        case "2":
          Get.until((route) => Get.currentRoute == Routes.LOGIN);
          break;
        default:
          Get.until((route) => Get.currentRoute == Routes.LOGIN);
      }
    } else {
      log("reload user : " + _appController.user!.emailVerified.toString());
      if (isReload) {
        getUserVerified();
      }
    }
  }
}
