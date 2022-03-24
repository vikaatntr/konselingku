import 'package:get/get.dart';

import '../controllers/guru_home_appointment_controller.dart';

class GuruHomeAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuruHomeAppointmentController>(
      () => GuruHomeAppointmentController(),
    );
  }
}
