import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class CounselingAppointmentController extends GetxController
    with StateMixin<List<UserData>> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    try {
      UserRepository.instance.getListUser().then((value) {
        var guru = value.where((element) => element.role == "2");
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
