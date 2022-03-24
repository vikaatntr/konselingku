import 'package:get/get.dart';

import '../controllers/form_appointment_controller.dart';

class FormAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormAppointmentController>(
      () => FormAppointmentController(),
    );
  }
}
