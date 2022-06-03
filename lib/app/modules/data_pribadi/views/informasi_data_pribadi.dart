import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

class InfoDataPribadiView extends GetView<DataPribadiController> {
  InfoDataPribadiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Feather.x,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Data Pribadi",
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        actions: [
          controller.isViewOnly
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.saveInfoDataPribadi();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Feather.check,
                      color: AppColors.black,
                    ),
                  ),
                )
        ],
      ),
      body: _body(),
    );
  }

  final _formKey = GlobalKey<FormState>();
  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _alamatInput(),
              const SizedBox(height: 20),
              _distanceInput(),
              const SizedBox(height: 20),
              _asalSekolahInput(),
              const SizedBox(height: 20),
              _kelasInput(),
              const SizedBox(height: 20),
              _graduateInput(),
              const SizedBox(height: 20),
              _nilaiInput(),
              const SizedBox(height: 20),
              _hobbyInput(),
              const SizedBox(height: 20),
              _favPelajaranInput(),
              const SizedBox(height: 20),
              _citaInput(),
              const SizedBox(height: 20),
              _nisnInput(),
              const SizedBox(height: 20),
              _bbInput(),
              const SizedBox(height: 20),
              _tbInput()
            ],
          )),
    );
  }

  Widget _alamatInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['alamat'],
        title: "Alamat",
        placeholder: "Masukkan alamatmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan alamatmu terlebih dahulu';
          }
          return null;
        });
  }

  Widget _distanceInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['jarakSekolah'],
        title: "Jarak dari rumah ke sekolah",
        placeholder: "Masukkan jarak (km)",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan jarak rumahmu ke sekolah';
          }
          return null;
        });
  }

  Widget _asalSekolahInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['asalSekolah'],
        title: "Asal Sekolah",
        placeholder: "Masukkan asal sekolahmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan asal sekolahmu';
          }
          return null;
        });
  }

  Widget _kelasInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['kelas'],
        title: "Kelas",
        placeholder: "Masukkan kelasmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan kelasmu';
          }
          return null;
        });
  }

  Widget _graduateInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['lulusSekolah'],
        title: "Lulus Sekolah",
        placeholder: "Lulus sekolah pada tahun",
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tahun lulus sekolahmu';
          }
          return null;
        });
  }

  Widget _nilaiInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['nilaiSKHUN'],
        title: "Rata-rata Nilai SKHUN",
        placeholder: 'Masukkan rata-rata nilaimu',
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan rata-rata nilaimu';
          }
          return null;
        });
  }

  Widget _hobbyInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['hobby'],
        title: "Hobby",
        placeholder: "Masukkan hobbymu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan hobbymu terlebih dahulu';
          }
          return null;
        });
  }

  Widget _favPelajaranInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller:
            controller.infoPribadiSiswaTextController['pelajaranYangDisenangi'],
        title: "Pelajaran yang Disenangi",
        placeholder: "Masukkan pelajaran yang disenangi",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pelajaran yang disenangi';
          }
          return null;
        });
  }

  Widget _citaInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['citaCita'],
        title: "Cita-cita",
        placeholder: "Masukkan cita-citamu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan cita-citamu';
          }
          return null;
        });
  }

  Widget _nisnInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['nisn'],
        title: "NISN",
        placeholder: "Masukkan NISN-mu",
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan NISN-mu';
          }
          return null;
        });
  }

  Widget _bbInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['beratBadan'],
        title: "Berat Badan",
        placeholder: "Masukkan berat badanmu",
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan berat badanmu';
          }
          return null;
        });
  }

  Widget _tbInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        controller: controller.infoPribadiSiswaTextController['tinggiBadan'],
        title: "Tinggi Badan",
        placeholder: "Masukkan tinggi badanmu",
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tinggi badanmu';
          }
          return null;
        });
  }
}
