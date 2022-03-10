import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminHomeController>(
      AdminHomeController(),
    );
  }
}
