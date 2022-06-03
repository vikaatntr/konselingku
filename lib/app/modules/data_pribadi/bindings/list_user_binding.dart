import 'package:get/get.dart';
import 'package:konselingku/app/modules/data_pribadi/controllers/list_siswa.dart';

import '../controllers/data_pribadi_controller.dart';

class ListUserDataPribadiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListUserController>(
      ListUserController(),
    );
  }
}
