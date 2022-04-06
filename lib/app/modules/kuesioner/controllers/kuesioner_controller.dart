import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/kuesioner.dart';
import 'package:konselingku/app/data/repository/kuesioner_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/modules/kuesioner/views/soal.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class KuesionerController extends GetxController with StateMixin<Kuesioner?> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    KuesionerRepository.instance.getKuesioner().then((value) {
      if (value != null) {
        for (var i = 0; i < pertanyaan1.length; i++) {
          listValuePertanyaan1[i] = value.pertanyaan1[i].values.first;
        }
        for (var i = 0; i < pertanyaan2.length; i++) {
          listValuePertanyaan2[i] = value.pertanyaan2[i].values.first;
        }
        for (var i = 0; i < pertanyaan3.length; i++) {
          listValuePertanyaan3[i] = value.pertanyaan3[i].values.first;
        }
        for (var i = 0; i < pertanyaan4.length; i++) {
          listValuePertanyaan4[i] = value.pertanyaan4[i].values.first;
        }
        Get.toNamed(Routes.HASILKUESIONER);
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    });

    super.onInit();
  }

  RxList<int> listValuePertanyaan1 =
      RxList(List.generate(pertanyaan1.length, (index) => 0));
  RxList<int> listValuePertanyaan2 =
      RxList(List.generate(pertanyaan2.length, (index) => 0));
  RxList<int> listValuePertanyaan3 =
      RxList(List.generate(pertanyaan3.length, (index) => 0));
  RxList<int> listValuePertanyaan4 =
      RxList(List.generate(pertanyaan4.length, (index) => 0));

  Future<void> submit() async {
    CustomDialog.loadingDialog();
    try {
      var kuesioner = Kuesioner(
          email: UserRepository.instance.user!.email,
          dateCreated: Timestamp.fromDate(DateTime.now()),
          pertanyaan1: List.generate(pertanyaan1.length,
              (index) => {pertanyaan1[index]: listValuePertanyaan1[index]}),
          pertanyaan2: List.generate(pertanyaan2.length,
              (index) => {pertanyaan2[index]: listValuePertanyaan2[index]}),
          pertanyaan3: List.generate(pertanyaan3.length,
              (index) => {pertanyaan3[index]: listValuePertanyaan3[index]}),
          pertanyaan4: List.generate(pertanyaan4.length,
              (index) => {pertanyaan4[index]: listValuePertanyaan4[index]}));
      await KuesionerRepository.instance.submitKuesioner(kuesioner);
      Get.back();
      Get.back();
      Get.snackbar("Berhasil!", "Kuesioner sudah disimpan!");
    } catch (e, stackTrace) {
      Get.back();
      Get.back();
      Get.snackbar("Oops!", "Gagal menyimpan kuesioner!");
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
