import 'dart:developer';
import 'dart:ui';

import 'package:background_locator/background_locator.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/repository.dart';
import 'package:konselingku/app/data/services/user_services.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

import '../../modules/user_home/controllers/location_service_repository.dart';

class UserRepository {
  final AppController _appController = Get.find();
  static final UserRepository _userRepository = UserRepository._();
  static UserRepository get instance => _userRepository;
  UserRepository._();

  UserData? user;
  UserData? admin;
  List<UserData>? listUser;
  Map<String, dynamic>? sekolah;

  dispose() {
    user = null;
    admin = null;
    listUser = null;
    sekolah = null;
  }

  Future<bool> createUser(UserData userData) async {
    var result = await UserServices.instance.createUser(userData);
    if (userData.role != '0') {
      try {
        admin ??= await getAnotherUser(adminEmail);
        await NotificationRepository.instance.sendNotif(
            to: admin!,
            from: userData.email,
            category: "Pendaftaran",
            title: "Persetujuan Pendaftaran",
            message: "${userData.namaLengkap} meminta persetujuan");
      } catch (e, stackTrace) {
        log(e.toString(), stackTrace: stackTrace);
      }
    }
    return result;
  }

  Future<UserData?> getUser() async {
    String uid = _appController.auth.currentUser!.uid;
    user = await UserServices.instance.getUser(uid);
    await getSekolah();
    return user;
  }

  Future<UserData?> getAnotherUser(String email) async {
    return await UserServices.instance.getAnotherUser(email);
  }

  Future<void> blockAccount(String uid) =>
      UserServices.instance.blockAccount(uid);

  Future<void> acceptAccount(String uid) =>
      UserServices.instance.acceptAccount(uid);

  Future<List<UserData>> getListUser() async {
    if (listUser == null) {
      listUser = [];
    } else {
      listUser!.clear();
    }
    listUser!.addAll(await UserServices.instance.getListUser());
    return listUser!;
  }

  Future<void> setFarFromSchool(UserData userData) async {
    await UserServices.instance.updateUser(userData.uid, userData);
    try {
      listUser ??= await getListUser();
      for (var element in listUser!) {
        if (element.role.contains("2")) {
          NotificationRepository.instance.sendNotif(
              to: element,
              from: userData.email,
              category: "Pelanggaran",
              title: "Pelanggaran",
              message: "${userData.namaLengkap} Jauh dari sekolah");
        }
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<void> logOut() async {
    await _appController.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
    _appController.userData = null;
    if (user!.role == "0") {
      IsolateNameServer.removePortNameMapping(
          LocationServiceRepository.isolateName);
      BackgroundLocator.unRegisterLocationUpdate();
    }
    Repository.dispose();
  }

  Future<void> saveFCMToken(String token) => UserServices.instance
      .saveFCMToken(token, _appController.auth.currentUser!.uid);

  Future<void> updateUser(UserData userUpDate) async {
    try {
      user = userUpDate;
      await UserServices.instance.updateUser(user!.uid, userUpDate);
    } catch (e) {
      Get.snackbar("Oops!", e.toString());
    }
  }

  Future<void> getSekolah() async {
    sekolah = await UserServices.instance.getSekolah();
  }
}
