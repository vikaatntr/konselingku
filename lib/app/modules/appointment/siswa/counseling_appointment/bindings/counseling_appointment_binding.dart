import 'package:get/get.dart';

import '../controllers/counseling_appointment_controller.dart';

class CounselingAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounselingAppointmentController>(
      () => CounselingAppointmentController(),
    );
  }
}
