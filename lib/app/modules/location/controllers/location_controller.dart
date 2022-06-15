import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class LocationController extends GetxController {
  UserData user =
      Get.arguments is UserData ? Get.arguments : UserRepository.instance.user;
}
