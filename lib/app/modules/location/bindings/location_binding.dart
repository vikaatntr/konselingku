import 'package:get/get.dart';
import 'package:konselingku/app/modules/location/controllers/list_siswa_location_controller.dart';

import '../controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(
      () => LocationController(),
    );
  }
}

class ListSiswaLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListSiswaLocationController>(
      () => ListSiswaLocationController(),
    );
  }
}
