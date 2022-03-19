import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class FormAppointmentController extends GetxController {
  late UserData guru;

  TextEditingController bidangController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments is UserData) {
        guru = Get.arguments;
      } else {
        Get.back();
      }
    } else {
      Get.back();
    }
    super.onInit();
  }

  @override
  void onClose() {
    bidangController.dispose();
    dateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  Future<void> addCounseling() async {
    CustomDialog.loadingDialog();
    try {
      await CounselingRepository.instance.addCounseling(
          counseling: Counseling(
              bidang: bidangController.text,
              date: dateController.text,
              description: descriptionController.text,
              jam: timeController.text,
              emailGuru: guru.email,
              emailSiswa: UserRepository.instance.user!.email));
      Get.back();
      Get.back();
      Get.snackbar("Success!",
          "Berhasil mengirimkan jadwal ke Pak/Bu ${guru.namaPanggilan}");
    } catch (e) {
      Get.back();
      Get.back();
      Get.snackbar("Oops!", "Terjadi kesalahan");
    }
  }
}
