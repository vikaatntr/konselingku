import 'package:get/get.dart';

import '../controllers/rekap_counseling_controller.dart';

class RekapCounselingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekapCounselingController>(
      () => RekapCounselingController(),
    );
  }
}
