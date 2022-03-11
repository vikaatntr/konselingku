// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class AdminHomeController extends GetxController {
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  StreamSubscription<String>? onChangeFCMTokenListener;
  StreamSubscription<RemoteMessage>? onMessage;

  RxList<UserData> listAllUser = RxList([]);
  RxList<UserData> listUser = RxList([]);
  final AppController appController = Get.find();

  @override
  onInit() async {
    await fetchData();
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
      await fetchData();
      Get.snackbar(event.notification!.title!, event.notification!.body!);
    });
    super.onInit();
  }

  Future<void> fetchData() async {
    listAllUser.clear();
    listAllUser.addAll(await UserRepository.instance.getListUser());
    await appController.getUserData();
  }

  Future<void> requestFCMPermission() async {
    NotificationSettings current = await fcm.getNotificationSettings();
    if (current.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (current.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
      NotificationSettings settings = await fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  void routesListUser(int menu) {
    switch (menu) {
      case 0:
        listUser.clear();
        listUser.addAll(listAllUser.where((user) => user.role == '0').toList());
        Get.toNamed(Routes.LIST_USER);
        break;
      case 1:
        listUser.clear();
        listUser.addAll(listAllUser
            .where((user) => user.role == '1' && user.isAccept)
            .toList());
        Get.toNamed(Routes.LIST_USER);
        break;
      case 2:
        listUser.clear();
        listUser.addAll(listAllUser
            .where((user) => user.role == '2' && user.isAccept)
            .toList());
        Get.toNamed(Routes.LIST_USER);
        break;
      case 3:
        listUser.clear();
        listUser.addAll(listAllUser
            .where((user) => user.role == '2' && !user.isAccept)
            .toList());
        Get.toNamed(Routes.LIST_USER);
        break;
      case 4:
        listUser.clear();
        listUser.addAll(listAllUser
            .where((user) => user.role == '1' && !user.isAccept)
            .toList());
        Get.toNamed(Routes.LIST_USER);
        break;
    }
  }

  @override
  void onClose() {
    onChangeFCMTokenListener!.cancel();
    onMessage!.cancel();
    super.onClose();
  }
}
