import 'package:get/get.dart';

import '../controllers/wali_home_controller.dart';

class WaliHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaliHomeController>(
      () => WaliHomeController(),
    );
  }
}
