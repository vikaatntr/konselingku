import 'package:get/get.dart';
import 'package:konselingku/app/modules/kuesioner/controllers/list_kuesioner_controller.dart';

class ListKuesionerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListKuesionerController>(
      () => ListKuesionerController(),
    );
  }
}
