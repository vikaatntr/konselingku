import 'package:get/get.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class GuruHomeController extends GetxController {
  final AppController appController = Get.find();
  // ignore: todo
  //TODO: Implement GuruHomeController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}
