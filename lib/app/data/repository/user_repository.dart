import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/services/user_services.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';

class UserRepository {
  final AppController _appController = Get.find();
  static final UserRepository _userRepository = UserRepository._();
  static UserRepository get instance => _userRepository;
  UserRepository._();

  UserData? user;

  Future<bool> createUser(UserData userData) =>
      UserServices.instance.createUser(userData);

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
}
