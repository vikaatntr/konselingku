import 'package:get/get.dart';
import 'package:konselingku/app/data/model/kuesioner.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/kuesioner_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/modules/kuesioner/views/hasil_kuesioner_from_list.dart';

class ListKuesionerController extends GetxController
    with StateMixin<List<Kuesioner>> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    if (KuesionerRepository.instance.listKuesioner != null) {
      if (UserRepository.instance.user!.role == '1') {
        List<Kuesioner> kuesionerAnak = KuesionerRepository
            .instance.listKuesioner!
            .where((element) =>
                element.email == UserRepository.instance.user!.emailAnak)
            .toList();
        if (kuesionerAnak.isEmpty) {
          Get.off(() => const HasilKuesionerFromList(kuesioner: null));
        } else {
          Get.off(
              () => HasilKuesionerFromList(kuesioner: kuesionerAnak.single));
        }
      }
      change(KuesionerRepository.instance.listKuesioner,
          status: RxStatus.success());
    }
    super.onInit();
  }

  @override
  void onReady() {
    try {
      KuesionerRepository.instance.getAllKuesioner().then((value) async {
        if (value.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          List<UserData> listSiswa =
              await UserRepository.instance.getListUser();
          for (var item in value) {
            item.user = listSiswa
                .where((element) => element.email == item.email)
                .single;
          }
          KuesionerRepository.instance.listKuesioner = value;
          if (UserRepository.instance.user!.role == '1') {
            List<Kuesioner> kuesionerAnak = KuesionerRepository
                .instance.listKuesioner!
                .where((element) =>
                    element.email == UserRepository.instance.user!.emailAnak)
                .toList();
            if (kuesionerAnak.isEmpty) {
              Get.off(() => const HasilKuesionerFromList(kuesioner: null));
            } else {
              Get.off(() =>
                  HasilKuesionerFromList(kuesioner: kuesionerAnak.single));
            }
          }
          change(value, status: RxStatus.success());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onReady();
  }
}
