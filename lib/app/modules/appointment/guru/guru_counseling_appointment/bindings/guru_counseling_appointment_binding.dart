import 'package:get/get.dart';

import '../controllers/guru_counseling_appointment_controller.dart';

class GuruCounselingAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuruCounselingAppointmentController>(
      () => GuruCounselingAppointmentController(),
    );
  }
}
