import 'package:get/get.dart';

import '../controllers/data_pribadi_controller.dart';

class DataPribadiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataPribadiController>(
      DataPribadiController(),
    );
  }
}
