import 'dart:developer';

import 'package:get/get.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/services/user_services.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class UserRepository {
  final AppController _appController = Get.find();
  static final UserRepository _userRepository = UserRepository._();
  static UserRepository get instance => _userRepository;
  UserRepository._();

  UserData? user;
  UserData? admin;

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
    return user;
  }

  Future<UserData?> getAnotherUser(String email) async {
    user = await UserServices.instance.getAnotherUser(email);
    return user;
  }

  Future<void> logOut() async {
    await _appController.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
    _appController.userData = null;
    user = null;
  }

  Future<void> saveFCMToken(String token) => UserServices.instance
      .saveFCMToken(token, _appController.auth.currentUser!.uid);
}
