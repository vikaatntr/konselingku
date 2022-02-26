import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/services/user_services.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._();
  static UserRepository get instance => _userRepository;
  final AppController _appController = Get.find();
  UserRepository._();

  Future<bool> createUser(UserData userData) =>
      UserServices.instance.createUser(userData);

  Future<UserData?> getUser() =>
      UserServices.instance.getUser(_appController.auth.currentUser!.uid);
}
