import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

class permintaanKonseling extends StatelessWidget {
  const permintaanKonseling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Permintaan Konseling'),
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
            _buttonPersetujuan()
          ],
        ),
      )),
    );
  }

  Widget _namaSiswa() {
    return formInput(
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

  Widget _buttonPersetujuan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 135,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kWhite,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "Tolak",
              style: GoogleFonts.poppins(
                  color: AppColors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 135,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              "Terima",
              style: GoogleFonts.poppins(
                  color: AppColors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
