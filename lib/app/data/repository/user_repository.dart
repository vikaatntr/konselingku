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
  List<UserData>? listUser;

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

  Future<void> logOut() async {
    await _appController.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
    _appController.userData = null;
    user = null;
  }

  Future<void> saveFCMToken(String token) => UserServices.instance
      .saveFCMToken(token, _appController.auth.currentUser!.uid);

  Future<void> updateUser(UserData user) =>
      UserServices.instance.updateUser(user.uid, user);
}
