import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import '../controllers/guru_form_appointment_controller.dart';

class GuruFormAppointmentView extends GetView<GuruFormAppointmentController> {
  const GuruFormAppointmentView({Key? key}) : super(key: key);

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
            _siswaInput(),
            const SizedBox(height: 20),
            _bidangInput(),
            const SizedBox(height: 20),
            _dateInput(),
            const SizedBox(height: 20),
            _timeInput(),
            const SizedBox(height: 20),
            _descriptionInput(),
            const SizedBox(height: 70),
            _btnInput()
          ],
        ),
      )),
    );
  }

  Widget _siswaInput() {
    //dropdown pilih siswa
    return formInput(
        title: "Pilih siswa yang akan melakukan konseling",
        placeholder: "Pilih siswa",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Pilih siswa';
          }
          return null;
        });
  }

  Widget _bidangInput() {
    //dropdown bidang
    return formInput(
        title: "Permasalahan bidang apa yang akan dikonselingkan",
        placeholder: "Pilih permasalahan di bidang apa",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Pilih permasalahan di bidang apa';
          }
          return null;
        });
  }

  Widget _dateInput() {
    //pilih tanggal
    return formInput(
        title: "Tanggal pelaksanaan konseling",
        placeholder: "Pilih tanggal",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tanggal pelaksanaan konseling';
          }
          return null;
        });
  }

  Widget _timeInput() {
    // pilih waktu
    return formInput(
        title: "Waktu",
        placeholder: "Pilih waktu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan waktu pelaksanaan konsleing';
          }
          return null;
        });
  }

  Widget _descriptionInput() {
    return formInput(
        title: "Deskripsi permasalahan",
        placeholder: "Masukkan deskripsi permasalahanmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan deskripsi permasalahanmu';
          }
          return null;
        });
  }

  Widget _btnInput() {
    return Center(
      child: SizedBox(
          width: Get.width / 1.6,
          child: GetPlatform.isIOS
              ? CupertinoButton.filled(
                  disabledColor: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  onPressed: () {},
                  child: Text("Lanjutkan",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                )
              : ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.primaryColor),
                  onPressed: () {},
                  child: Text("Lanjutkan",
                      style:
                          GoogleFonts.poppins(fontWeight: FontWeight.bold)))),
    );
  }
}
