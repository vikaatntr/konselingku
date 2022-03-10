import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/services/notification_services.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class NotificationRepository {
  final AppController _appController = Get.find();
  static final NotificationRepository _notificationRepository =
      NotificationRepository._();
  static NotificationRepository get instance => _notificationRepository;
  NotificationRepository._();

  Future<void> sendNotif(
      {required UserData to,
      required String title,
      required String message,
      required String from,
      required String category}) async {
    await NotificationServices.instance.saveNotification(
        to: to, category: category, user: from, message: message, title: title);
    await NotificationServices.instance
        .sendFCM(fcmToken: to.fcmToken!, title: title, body: message, data: {});
  }

  Future<void> readNotif() =>
      NotificationServices.instance.readNotif(_appController.userData!);
}
