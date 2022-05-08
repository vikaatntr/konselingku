import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/dialog.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import '../controllers/guru_form_appointment_controller.dart';

class GuruFormAppointmentView extends GetView<GuruFormAppointmentController> {
  const GuruFormAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Permintaan Konseling'),
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
            _namaSiswa(),
            const SizedBox(height: 20),
            _bidangInput(),
            const SizedBox(height: 20),
            _dateInput(),
            const SizedBox(height: 20),
            _timeInput(),
            const SizedBox(height: 20),
            _descriptionInput(),
            const SizedBox(height: 30),
            controller.counseling != null
                ? controller.counseling!.status == "Menunggu"
                    ? _buttonPersetujuan()
                    : const SizedBox.shrink()
                : _btnInput()
          ],
        ),
      )),
    );
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
                  child: Text("Simpan",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                )
              : ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.primaryColor),
                  onPressed: () {
                    controller.addCounseling();
                  },
                  child: Text("Simpan",
                      style:
                          GoogleFonts.poppins(fontWeight: FontWeight.bold)))),
    );
  }

  Widget _namaSiswa() {
    return formInput(
        intialValue: controller.siswa!.namaLengkap,
        title: 'Nama',
        placeholder: 'Nama',
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Pilih permasalahan di bidang apa';
          }
          return null;
        });
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

  Widget _buttonPersetujuan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () async {
            CustomDialog.loadingDialog();
            await CounselingRepository.instance
                .tolakCounseling(counseling: controller.counseling!);
            Get.back();
            Get.back();
            Get.back();
          },
          child: Container(
            height: 50,
            width: 135,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.kWhite,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                "Tolak",
                style: GoogleFonts.poppins(
                    color: AppColors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            CustomDialog.loadingDialog();
            await CounselingRepository.instance
                .accCounseling(counseling: controller.counseling!);
            Get.back();
            Get.back();
            Get.back();
          },
          child: Container(
            height: 50,
            width: 135,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                "Terima",
                style: GoogleFonts.poppins(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
