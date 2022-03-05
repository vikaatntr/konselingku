import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/views/counseling_appointment/form_appointment.dart';
import 'package:konselingku/widgets/general/app_bar.dart';

class appointmentPage extends StatelessWidget {
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
          child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _subtitle(),
            SizedBox(height: 20),
            _teacherBox1(),
          ],
        ),
      )),
    );
  }

  Widget _subtitle() {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
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
    return GestureDetector(
      onTap: () {
        Get.to(formAppointment());
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.all(12),
        height: 180,
        width: 370,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.5),
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Container(child: Image.asset('assets/images/ibu.png')),
            SizedBox(width: 12),
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
      ),
    );
  }
}
