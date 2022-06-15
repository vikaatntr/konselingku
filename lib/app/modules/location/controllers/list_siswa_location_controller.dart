import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';

import '../../../data/repository/user_repository.dart';

class ListSiswaLocationController extends GetxController
    with StateMixin<List<UserData>?> {
  @override
  void onInit() {
    getListSiswa();
    super.onInit();
  }

  Future<void> getListSiswa() async {
    change(null, status: RxStatus.loading());
    try {
      UserRepository.instance.getListUser().then((value) {
        var guru = value.where(
            (element) => element.role == "0" && (element.is_far ?? false));
        if (guru.isNotEmpty) {
          change(guru.toList(), status: RxStatus.success());
        } else {
          change([], status: RxStatus.empty());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }
}
