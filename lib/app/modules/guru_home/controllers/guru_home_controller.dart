import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class GuruHomeController extends GetxController {
  final AppController appController = Get.find();

  FirebaseMessaging fcm = FirebaseMessaging.instance;

  StreamSubscription<String>? onChangeFCMTokenListener;
  StreamSubscription<RemoteMessage>? onMessage;
  @override
  void onClose() {
    onChangeFCMTokenListener!.cancel();
    onMessage!.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    fcm.getToken().then((value) {
      if (value != null) {}
    });
    requestFCMPermission().then((_) {
      fcm.getToken().then((value) {
        if (value != null) {
          UserRepository.instance.saveFCMToken(value);
        }
      });
    });
    onChangeFCMTokenListener =
        fcm.onTokenRefresh.listen(UserRepository.instance.saveFCMToken);

    onMessage = FirebaseMessaging.onMessage.listen((event) async {
      Get.snackbar(event.notification!.title!, event.notification!.body!);
    });
    super.onInit();
  }

  Future<void> requestFCMPermission() async {
    NotificationSettings current = await fcm.getNotificationSettings();
    if (current.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (current.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
      NotificationSettings settings = await fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (kDebugMode) {
        print('User granted permission: ${settings.authorizationStatus}');
      }
    }
  }
}
