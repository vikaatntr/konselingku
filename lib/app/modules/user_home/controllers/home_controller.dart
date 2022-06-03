// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'dart:math';

import 'package:background_locator/background_locator.dart';
import 'package:background_locator/location_dto.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/artikel.dart';
import 'package:konselingku/app/data/model/nomor_penting.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/artikel_repository.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/data/repository/nomor_penting_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:permission_handler/permission_handler.dart';

import '../views/detail_artikel_view.dart';
import 'location_callback_handler.dart';
import 'location_service_repository.dart';

class HomeController extends GetxController {
  final Rx<UserData?> _user = Rx<UserData?>(null);
  UserData? get user => _user.value;

  final RxList<Artikel> listArtikel = RxList<Artikel>();
  final RxList<NomorPenting> listNomorPenting = RxList<NomorPenting>();

  final UserRepository _userRepository = UserRepository.instance;
  final ArtikelRepository _artikelRepository = ArtikelRepository.instance;
  final NomorPentingRepository _nomorPentingRepository =
      NomorPentingRepository.instance;

  final _filterArtikel = "Terbaru".obs;
  String get filterArtikel => _filterArtikel.value;
  set filterArtikel(String val) => _filterArtikel.value = val;

  PageController artikelController = PageController();

  FirebaseMessaging fcm = FirebaseMessaging.instance;

  final artikelIndex = 0.obs;

  StreamSubscription<String>? onChangeFCMTokenListener;

  //Location Service
  ReceivePort port = ReceivePort();

  final _running = false.obs;
  set isRunning(bool val) => _running.value = val;
  bool get isRunning => _running.value;

  @override
  onInit() {
    getData();
    artikelController.addListener(() {
      artikelIndex.value = artikelController.page!.toInt();
    });
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

    if (IsolateNameServer.lookupPortByName(
            LocationServiceRepository.isolateName) !=
        null) {
      IsolateNameServer.removePortNameMapping(
          LocationServiceRepository.isolateName);
    }

    IsolateNameServer.registerPortWithName(
        port.sendPort, LocationServiceRepository.isolateName);

    port.listen(
      (dynamic data) async {
        print(data);
        if (data != null) {
          var now = DateTime.now();
          var sekolah = UserRepository.instance.sekolah;
          double lat1 = sekolah!['latitude'];
          double lon1 = sekolah['longitude'];
          double lat2 = data.latitude;
          double lon2 = data.longitude;
          var p = 0.017453292519943295;
          var c = cos;
          var a = 0.5 -
              c((lat2 - lat1) * p) / 2 +
              c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
          var result = 12742 * asin(sqrt(a));
          print(result);
          if (now.hour < 12 && now.hour > 6) {
            if (result > 0.15) {
              await updateUI(data,
                  title: "Pelanggaran", bigMsg: "Anda keluar area sekolah");
              var user = UserRepository.instance.user;
              if (!(user!.is_update)) {
                user.is_far = true;
                user.latitude = data.latitude;
                user.longitude = data.longitude;
                user.locationUpdate = Timestamp.fromDate(now);
                UserRepository.instance.setFarFromSchool(user);
                user.is_update = true;
              }
            } else {
              if (user!.is_far ?? false) {
                if ((user!.locationUpdate?.toDate().day ?? now.day) !=
                    now.day) {
                  user!.is_update = false;
                  user!.is_far = false;
                  user!.latitude = data.latitude;
                  user!.longitude = data.longitude;
                  UserRepository.instance.updateUser(user!);
                }
              } else {
                await updateUI(data,
                    title: "Yeay!", bigMsg: "Anda masih di area sekolah");
              }
            }
          } else {
            await updateUI(data,
                title: "Tetap tenang", bigMsg: "Bukan jam sekolah");
            var user = UserRepository.instance.user;
            if (user!.is_far ?? false) {
              user.is_update = false;
              user.is_far = false;
              user.latitude = data.latitude;
              user.longitude = data.longitude;
              UserRepository.instance.updateUser(user);
            }
          }
        }
      },
    );
    initPlatformState().then((value) => _onStart());
    super.onInit();
  }

  void onStop() async {
    await BackgroundLocator.unRegisterLocationUpdate();
    final _isRunning = await BackgroundLocator.isServiceRunning();
    isRunning = _isRunning;
  }

  void _onStart() async {
    if (await _checkLocationPermission()) {
      await startLocationService();
      final _isRunning = await BackgroundLocator.isServiceRunning();
      isRunning = _isRunning;
    } else {
      // show error
    }
  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();
    isRunning = await BackgroundLocator.isServiceRunning();
  }

  Future<void> updateUI(LocationDto? data,
      {String? title, String? msg, String? bigMsg}) async {
    if (data == null) {
      return;
    }
    await _updateNotificationText(data, title: title, msg: msg, bigMsg: bigMsg);
  }

  Future<void> _updateNotificationText(LocationDto? data,
      {String? title, String? msg, String? bigMsg}) async {
    if (data == null) {
      return;
    }

    await BackgroundLocator.updateNotificationText(
        title: title ?? "new location received",
        msg: msg ?? "${DateTime.now()}",
        bigMsg: bigMsg ?? "${data.latitude}, ${data.longitude}");
  }

  Future<void> startLocationService() async {
    Map<String, dynamic> data = {'countInit': 1};
    return await BackgroundLocator.registerLocationUpdate(
        LocationCallbackHandler.callback,
        initCallback: LocationCallbackHandler.initCallback,
        initDataCallback: data,
        disposeCallback: LocationCallbackHandler.disposeCallback,
        autoStop: false,
        iosSettings: const IOSSettings(
            accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 0),
        androidSettings: const AndroidSettings(
            accuracy: LocationAccuracy.NAVIGATION,
            interval: 5,
            distanceFilter: 0,
            client: LocationClient.google,
            androidNotificationSettings: AndroidNotificationSettings(
                notificationChannelName: 'Location tracking',
                notificationTitle: 'Start Location Tracking',
                notificationMsg: 'Track location in background',
                notificationBigMsg:
                    'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
                notificationIconColor: Colors.grey,
                notificationTapCallback:
                    LocationCallbackHandler.notificationCallback)));
  }

  Future<bool> _checkLocationPermission() async {
    final access = await Permission.location.status;
    switch (access) {
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        final permission = await Permission.location.request();
        if (permission == PermissionStatus.granted) {
          return true;
        } else {
          return false;
        }
      case PermissionStatus.granted:
        return true;
      default:
        return false;
    }
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

  @override
  void onClose() {
    artikelController.dispose();
    if (onChangeFCMTokenListener != null) {
      onChangeFCMTokenListener!.cancel();
    }
    super.onClose();
  }

  Future<void> getData({bool refresh = false}) async {
    await Future.wait([
      getUserData(refresh: refresh),
      getArtikel(refresh: refresh),
      getNomorPenting(refresh: refresh),
      CounselingRepository.instance.getCounseling()
    ]);
    filterArtikel = "Terbaru";
  }

  Future<void> getUserData({bool refresh = false}) async {
    if (_userRepository.user == null || refresh) {
      _user.value = await _userRepository.getUser();
    } else {
      _user.value = _userRepository.user;
    }
  }

  Future<void> showArtikel(Artikel artikel) async {
    _artikelRepository.addShowArtikel(artikel.key!);
    Get.to(() => DetailArtikel(artikel: artikel));
  }

  Future<void> getArtikel({bool refresh = false}) async {
    if (_artikelRepository.listArtikel == null || refresh) {
      var res = await _artikelRepository.getArtikel();
      listArtikel.clear();
      listArtikel.addAll(res);
    } else {
      listArtikel.clear();
      listArtikel.addAll(_artikelRepository.listArtikel!);
    }
  }

  Future<void> getNomorPenting({bool refresh = false}) async {
    if (_nomorPentingRepository.listNomorPenting == null || refresh) {
      var res = await _nomorPentingRepository.getNomorPenting();
      listNomorPenting.clear();
      listNomorPenting.addAll(res);
    } else {
      listNomorPenting.clear();
      listNomorPenting.addAll(_nomorPentingRepository.listNomorPenting!);
    }
  }
}
