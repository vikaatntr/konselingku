import 'package:get/get.dart';

import '../controllers/guru_rekap_counseling_controller.dart';

class GuruRekapCounselingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuruRekapCounselingController>(
      () => GuruRekapCounselingController(),
    );
  }
}
