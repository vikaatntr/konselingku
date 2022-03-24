import 'package:get/get.dart';

import '../controllers/hasil_counseling_controller.dart';

class HasilCounselingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilCounselingController>(
      () => HasilCounselingController(),
    );
  }
}
