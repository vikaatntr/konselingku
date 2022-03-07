import 'package:get/get.dart';

import '../controllers/home_appointment_controller.dart';

class HomeAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAppointmentController>(
      () => HomeAppointmentController(),
    );
  }
}
