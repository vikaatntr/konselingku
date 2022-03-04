import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class AppController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;
  UserData? userData;
  bool get isLogin => user != null;

  void getRoutesByRole(String role) {
    if (role == '0') {
      Get.offAllNamed(Routes.USER_HOME);
    }
    if (role == '1') {
      Get.offAllNamed(Routes.WALI_HOME);
    }
    if (role == '2') {
      Get.offAllNamed(Routes.GURU_HOME);
    }
    if (role == '3') {
      Get.offAllNamed(Routes.ADMIN_HOME);
    }
  }

  Future<void> getUserData() async {
    userData = await UserRepository.instance.getUser();
  }
}
