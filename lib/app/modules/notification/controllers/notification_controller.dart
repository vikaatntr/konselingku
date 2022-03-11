import 'package:get/get.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class NotificationController extends GetxController {
  final AppController appController = Get.find();
  @override
  void onClose() {
    NotificationRepository.instance.readNotif();
    appController.getUserData();
    super.onClose();
  }
}
