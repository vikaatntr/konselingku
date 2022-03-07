import 'package:get/get.dart';

import '../controllers/guru_form_appointment_controller.dart';

class GuruFormAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuruFormAppointmentController>(
      () => GuruFormAppointmentController(),
    );
  }
}
