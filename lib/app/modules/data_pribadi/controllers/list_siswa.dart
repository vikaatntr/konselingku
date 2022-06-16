import 'package:get/get.dart';

import '../../../data/model/user.dart';
import '../../../data/repository/user_repository.dart';
import '../../../routes/app_pages.dart';

class ListUserController extends GetxController
    with StateMixin<List<UserData>> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    try {
      UserRepository.instance.getListUser().then((value) {
        var guru = value.where((element) => element.role == "0");
        if (guru.isNotEmpty) {
          if (UserRepository.instance.user!.role == "1") {
            List<UserData> listAnak = value
                .where((element) =>
                    element.email == UserRepository.instance.user!.emailAnak)
                .toList();
            UserData? anak = listAnak.isEmpty ? null : listAnak.first;
            if (anak != null) {
              Get.toNamed(Routes.MENU_DATA_PRIBADI, arguments: anak);
            } else {
              change([], status: RxStatus.empty());
            }
          } else {
            change(guru.toList(), status: RxStatus.success());
          }
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
