import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import '../controllers/form_appointment_controller.dart';

class FormAppointmentView extends GetView<FormAppointmentController> {
  const FormAppointmentView({Key? key}) : super(key: key);

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
            cardTeacher(),
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

  Widget _bidangInput() {
    //dropdown bidang
    return formInput(
        controller: controller.bidangController,
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
        onTap: () async {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          DateTime? date = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2055),
          );
          if (date != null) {
            controller.dateController.text = date.toString().split(' ')[0];
          }
        },
        enabled: false,
        controller: controller.dateController,
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
        onTap: () async {
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          final TimeOfDay? picked = await showTimePicker(
            context: Get.context!,
            initialTime: TimeOfDay.now(),
          );
          if (picked != null) {
            var hour = picked.hour.toString();
            if (hour.length == 1) {
              hour = '0' + hour;
            }
            var minute = picked.minute.toString();
            if (minute.length == 1) {
              minute = '0' + minute;
            }
            controller.timeController.text = hour + ':' + minute + ' WIB';
          }
        },
        controller: controller.timeController,
        title: "Waktu",
        enabled: false,
        placeholder: "Pilih waktu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan waktu pelaksanaan konsleing';
          }
          if ((int.tryParse(value.toString().split(':')[0]) ?? 0) > 12 ||
              (int.tryParse(value.toString().split(':')[0]) ?? 0) < 7) {
            return 'Hanya untuk pukul 07:00 - 12:00 WIB';
          }
          return null;
        });
  }

  Widget _descriptionInput() {
    return formInput(
        controller: controller.descriptionController,
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
                  onPressed: () {
                    controller.addCounseling();
                  },
                  child: Text("Lanjutkan",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                )
              : ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.primaryColor),
                  onPressed: () {
                    controller.addCounseling();
                  },
                  child: Text("Lanjutkan",
                      style:
                          GoogleFonts.poppins(fontWeight: FontWeight.bold)))),
    );
  }

  Widget cardTeacher() {
    var guru = controller.guru;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
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
          guru.photoUrl == ""
              ? const SizedBox.shrink()
              : Image.network(guru.photoUrl),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guru.namaLengkap,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Guru Bimbingan Konseling",
                  style: GoogleFonts.poppins(),
                ),
                Text(
                  "NIP. ${guru.nip}",
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