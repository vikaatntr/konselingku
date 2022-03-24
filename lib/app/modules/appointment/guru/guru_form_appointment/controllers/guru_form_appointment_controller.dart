import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class GuruFormAppointmentController extends GetxController {
  final AppController appController = Get.find();
  UserData? siswa = Get.arguments['siswa'];
  Counseling? counseling = Get.arguments['counseling'];
  TextEditingController bidangController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    if (counseling != null) {
      bidangController.text = counseling!.bidang;
      dateController.text = counseling!.date;
      timeController.text = counseling!.jam;
      descriptionController.text = counseling!.description;
    }
    super.onInit();
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
              emailGuru: appController.userData!.email,
              emailSiswa: siswa!.email,
              status: "Diterima"),
          fromGuru: true);
      Get.back();
      Get.back();
      Get.back();
      Get.snackbar(
          "Success!", "Berhasil mengirimkan jadwal ke ${siswa!.namaPanggilan}");
    } catch (e) {
      Get.back();
      Get.back();
      Get.snackbar("Oops!", "Terjadi kesalahan");
    }
  }
}
