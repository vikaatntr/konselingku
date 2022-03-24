import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../controllers/guru_counseling_appointment_controller.dart';

class GuruCounselingAppointmentView
    extends GetView<GuruCounselingAppointmentController> {
  const GuruCounselingAppointmentView({Key? key}) : super(key: key);

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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _subtitle(),
          const SizedBox(height: 20),
          _teacherBox1(),
          const SizedBox(height: 20),
        ],
      )),
    );
  }

  Widget _subtitle() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Text(
        "Pilih Siswa",
        style: GoogleFonts.poppins(fontSize: 15),
      ),
    );
  }

  Widget _teacherBox1() {
    return Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: 10),
        child: controller.obx(
            (state) => Column(
                  children: [for (var item in state!) cardSiswa(item)],
                ),
            onEmpty: Column(
              children: const [
                Center(
                  child: Text("Tidak ada Siswa"),
                ),
              ],
            ),
            onError: (_) => Column(
                  children: const [
                    Center(child: Text("Maaf, Terjadi kesalahan!")),
                  ],
                ),
            onLoading: Column(
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            )));
  }

  Widget cardSiswa(UserData siswa) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.GURU_FORM_APPOINTMENT, arguments: {'siswa': siswa});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        padding: const EdgeInsets.all(12),
        height: 180,
        width: double.infinity,
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
            siswa.photoUrl == ""
                ? const SizedBox.shrink()
                : Image.network(siswa.photoUrl),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    siswa.namaLengkap,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Siswa Bimbingan Konseling",
                    style: GoogleFonts.poppins(),
                  ),
                  Text(
                    "No. Telp ${siswa.noTelp}",
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
