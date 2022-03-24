import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import '../controllers/guru_home_appointment_controller.dart';

class GuruHomeAppointmentView extends GetView<GuruHomeAppointmentController> {
  const GuruHomeAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Janji Konseling'),
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
            const SizedBox(height: 20),
            _contentBox3()
          ],
        ),
      )),
    );
  }

  Widget _contentBox1() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.GURU_COUNSELING_APPOINTMENT);
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
                "Janji Konseling",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text("Lakukan janji untuk melakukan janji konseling",
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
        Get.toNamed(Routes.GURU_REKAP_COUNSELING, arguments: "");
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
                "Permintaan Konseling",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text("Daftar Permintaan Konseling",
                  style:
                      GoogleFonts.poppins(fontSize: 13, color: AppColors.grey))
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox3() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.GURU_REKAP_COUNSELING);
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
                "Rekap Janji Konseling",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text("Lihat hasil konseling",
                  style:
                      GoogleFonts.poppins(fontSize: 13, color: AppColors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
