// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator/background_locator.dart';
import 'package:background_locator/location_dto.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/artikel.dart';
import 'package:konselingku/app/data/model/nomor_penting.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/artikel_repository.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/data/repository/nomor_penting_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

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
  static const String _isolateName = "LocatorIsolate";
  ReceivePort port = ReceivePort();

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
    port.listen((dynamic data) {
      // do something with data
    });
    initPlatformState();
    super.onInit();
  }

  Future<void> initPlatformState() async {
    await BackgroundLocator.initialize();
  }

  static void callback(LocationDto locationDto) async {
    final SendPort? send = IsolateNameServer.lookupPortByName(_isolateName);
    send?.send(locationDto);
  }

  void startLocationService() {
    Map<String, dynamic> data = {'countInit': 1};
    BackgroundLocator.registerLocationUpdate(LocationCallbackHandler.callback,
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
            androidNotificationSettings: AndroidNotificationSettings(
                notificationChannelName: 'Location tracking',
                notificationTitle: 'Start Location Tracking',
                notificationMsg: 'Track location in background',
                notificationBigMsg:
                    'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
                notificationIcon: '',
                notificationIconColor: Colors.grey,
                notificationTapCallback:
                    LocationCallbackHandler.notificationCallback)));
  }

//Optional
  static void notificationCallback() {
    print('User clicked on the notification');
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
