import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class GuruRekapCounselingController extends GetxController
    with StateMixin<List<Counseling>> {
  @override
  void onReady() {
    change(null, status: RxStatus.loading());
    try {
      CounselingRepository.instance.getCounseling().then((value) async {
        UserRepository.instance.listUser == null
            ? await UserRepository.instance.getListUser()
            : null;
        if (value.isNotEmpty) {
          if (Get.arguments == null) {
            change(
                value.where((element) => element.status != "Menunggu").toList(),
                status: RxStatus.success());
          } else {
            change(
                value.where((element) => element.status == "Menunggu").toList(),
                status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.empty());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onReady();
  }
}
