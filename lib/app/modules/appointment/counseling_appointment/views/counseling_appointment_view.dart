import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar_dashboard.dart';

import '../controllers/counseling_appointment_controller.dart';

class CounselingAppointmentView
    extends GetView<CounselingAppointmentController> {
  const CounselingAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Janji Konseling'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subtitle(),
            const SizedBox(height: 20),
            _teacherBox1(),
          ],
        ),
      )),
    );
  }

  Widget _subtitle() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Text(
        "Yuk pilih terlebih dahulu konselor terbaik yang akan membantu proses bimbingan konselingmu!",
        style: GoogleFonts.poppins(fontSize: 15),
      ),
    );
  }

  Widget _teacherBox1() {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardTeacher(),
          cardTeacher(),
        ],
      ),
    );
  }

  Widget cardTeacher() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      height: 180,
      width: 370,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.5),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          Image.asset('assets/images/ibu.png'),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wahyuni Widayati",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Guru Bimbingan Konseling",
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  "NIP. xxxxxxxxxxxxxxxxxxxxxxxxxxx",
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
