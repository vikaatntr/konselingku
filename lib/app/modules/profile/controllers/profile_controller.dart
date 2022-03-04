import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class ProfileController extends GetxController {
  final AppController _appController = Get.find();
  UserData get user => _appController.userData!;

  @override
  void onClose() {}

  Future<void> logOut() async {
    CustomDialog.loadingDialog();
    await UserRepository.instance.logOut();
  }
}
