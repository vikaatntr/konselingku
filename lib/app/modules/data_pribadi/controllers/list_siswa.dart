import 'package:get/get.dart';

import '../../../data/model/user.dart';
import '../../../data/repository/user_repository.dart';

class ListUserController extends GetxController
    with StateMixin<List<UserData>> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    try {
      UserRepository.instance.getListUser().then((value) {
        var guru = value.where((element) => element.role == "0");
        if (guru.isNotEmpty) {
          change(guru.toList(), status: RxStatus.success());
        } else {
          change([], status: RxStatus.empty());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
    super.onInit();
  }
}
