import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/views/counseling_appointment/counseling_appointment.dart';
import 'package:konselingku/views/counseling_appointment/rekap_counseling.dart';
import 'package:konselingku/widgets/general/app_bar.dart';

class homeAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Janji Konseling'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_contentBox1(), SizedBox(height: 20), _contentBox2()],
        ),
      )),
    );
  }

  Widget _contentBox1() {
    return GestureDetector(
      onTap: () {
        Get.to(appointmentPage());
      },
      child: Container(
        height: 90,
        width: Get.width,
        decoration: BoxDecoration(
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
        Get.to(rekapKonseling());
      },
      child: Container(
        height: 90,
        width: Get.width,
        decoration: BoxDecoration(
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
