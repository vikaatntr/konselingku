import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final AppController _appController = Get.find();
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => _appController.isLogin
            ? _appController.user!.emailVerified
                ? Get.offAllNamed(Routes.HOME)
                : Get.offAllNamed(Routes.LOGIN)
            : Get.offAllNamed(Routes.LOGIN));
    super.onInit();
  }

  @override
  void onClose() {}
}
