import 'package:get/get.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class NotificationController extends GetxController {
  final AppController appController = Get.find();
  var isDone = true.obs;
  @override
  void onInit() {
    if (UserRepository.instance.user!.role == '3') {
      isDone.value = false;
      UserRepository.instance.getListUser().then((value) {
        isDone.value = true;
      });
    }
    super.onInit();
  }

  @override
  void onClose() {
    NotificationRepository.instance.readNotif();
    appController.getUserData();
    super.onClose();
  }
}
