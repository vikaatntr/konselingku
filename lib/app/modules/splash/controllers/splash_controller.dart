import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final AppController _appController = Get.find();
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (_appController.isLogin) {
        await _appController.getUserData();
        if (_appController.userData!.role == '3') {
          Get.offAllNamed(Routes.ADMIN_HOME);
        } else {
          if (_appController.user!.emailVerified) {
            if (_appController.userData!.isAccept) {
              _appController.getRoutesByRole(_appController.userData!.role);
            } else {
              Get.offAllNamed(Routes.LOGIN);
            }
          } else {
            Get.offAllNamed(Routes.LOGIN);
          }
        }
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }
}
