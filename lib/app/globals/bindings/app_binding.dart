import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(),
    );
  }
}
