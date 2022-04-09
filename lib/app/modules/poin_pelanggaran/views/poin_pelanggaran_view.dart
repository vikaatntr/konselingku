import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/colors.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/general/app_bar.dart';
import '../controllers/poin_pelanggaran_controller.dart';

class PoinPelanggaranView extends GetView<PoinPelanggaranController> {
  const PoinPelanggaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Poin Pelanggaran'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _contentBox1(),
            const SizedBox(height: 20),
            _contentBox2(),
          ],
        ),
      )),
    );
  }

  Widget _contentBox1() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.LIST_SISWA_POIN_PELANGGARAN,
            arguments: Routes.POIN_PELANGGARAN_SISWA);
      },
      child: Container(
        height: 90,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Poin pelanggaran",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text("Memberi siswa poin pelanggaran",
                  style:
                      GoogleFonts.poppins(fontSize: 13, color: AppColors.grey))
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox2() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.LIST_SISWA_POIN_PELANGGARAN,
            arguments: Routes.POIN_PELANGGARAN_HASIL);
      },
      child: Container(
        height: 90,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hasil Poin Pelanggaran",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text("Melihat poin pelanggaran siswa",
                  style:
                      GoogleFonts.poppins(fontSize: 13, color: AppColors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
