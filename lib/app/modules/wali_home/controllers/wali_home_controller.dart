import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class WaliHomeController extends GetxController {
  UserData? anak;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<String> getPoinPelanggaran() async {
    int poin = 0;
    anak = await UserRepository.instance
        .getAnotherUser(UserRepository.instance.user!.emailAnak!);
    for (var element in anak!.poinPelanggaran.values) {
      poin += element.values.reduce((value, e) => value + e);
    }
    return poin.toString();
  }
}
