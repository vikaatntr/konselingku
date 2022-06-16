import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';

class RekapCounselingController extends GetxController
    with StateMixin<List<Counseling>> {
  @override
  void onReady() {
    change(null, status: RxStatus.loading());
    try {
      CounselingRepository.instance
          .getCounseling(user: Get.arguments)
          .then((value) {
        if (value.isNotEmpty) {
          change(value, status: RxStatus.success());
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
