// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

import '../../../widget/general/form_input.dart';

class KetLingkunganKelView extends GetView<DataPribadiController> {
  const KetLingkunganKelView({Key? key}) : super(key: key);

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
        title: Text("Ket. Lingkungan Keluarga",
            style: GoogleFonts.poppins(color: AppColors.black)),
        actions: [
          InkWell(
            onTap: () {
              controller.saveKeteranganKeluarga();
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

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _keadaanUtuhOrtuInput(),
          const SizedBox(height: 20),
          _keadaanOrtuInput(),
          const SizedBox(height: 20),
          _keadaanEkonomi(),
          const SizedBox(height: 20),
          _penghasilanOrtu(),
          const SizedBox(height: 20),
          _hubSosial(),
          const SizedBox(height: 20),
          _uangSaku(),
          const SizedBox(height: 20),
          _transportasiSekolah(),
          const SizedBox(height: 20),
          _masalahBelajar()
        ],
      )),
    );
  }

  Widget _keadaanUtuhOrtuInput() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keadaan Keutuhan Orang Tua",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.keadaanUtuhOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Utuh")),
            DropdownMenuItem(value: 1, child: Text("Cerai")),
            DropdownMenuItem(value: 2, child: Text("Pisah")),
            DropdownMenuItem(value: 3, child: Text("Ayah Meninggal")),
            DropdownMenuItem(value: 4, child: Text("Ibu Meninggal")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.keadaanUtuhOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Keadaan Keutuhan Orang Tua",
              hintStyle: GoogleFonts.poppins(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primaryColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        )
      ],
    );
  }

  Widget _keadaanOrtuInput() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keadaan Orang Tua Sekarang",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.keadaanOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Ayah Kandung")),
            DropdownMenuItem(value: 1, child: Text("Ayah Tiri")),
            DropdownMenuItem(value: 2, child: Text("Ibu Kandung")),
            DropdownMenuItem(value: 3, child: Text("Ibu Tiri")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.keadaanOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Keadaan Orang Tua Sekarang",
              hintStyle: GoogleFonts.poppins(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primaryColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        )
      ],
    );
  }

  Widget _keadaanEkonomi() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keadaan Ekonomi Keluarga",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.keadaanEkonomi,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Mampu")),
            DropdownMenuItem(value: 1, child: Text("Cukup")),
            DropdownMenuItem(value: 2, child: Text("Kurang")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.keadaanEkonomi = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Keadaan Ekonomi Keluarga",
              hintStyle: GoogleFonts.poppins(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primaryColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        )
      ],
    );
  }

  Widget _penghasilanOrtu() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Penghasilan Orang Tua",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.penghasilanOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("kurang dari Rp. 500.000")),
            DropdownMenuItem(
                value: 1, child: Text("Rp. 500.000 - Rp. 1.000.000")),
            DropdownMenuItem(
                value: 2, child: Text("Rp. 1.000.000 - Rp. 2.000.000")),
            DropdownMenuItem(
                value: 3, child: Text("Rp. 2.000.000 - Rp. 3.000.000")),
            DropdownMenuItem(value: 4, child: Text("Rp. 3.000.000 - keatas")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.penghasilanOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Penghasilan Orang Tua",
              hintStyle: GoogleFonts.poppins(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primaryColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        )
      ],
    );
  }

  Widget _hubSosial() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hubungan Sosial dalam Keluarga",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.sosialKeluarga,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Harmonis (rukun)")),
            DropdownMenuItem(value: 1, child: Text("Biasa-biasa saja")),
            DropdownMenuItem(
                value: 2, child: Text("Orang tua sering bertengkar")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.sosialKeluarga = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Hubungan Sosial dalam Keluarga",
              hintStyle: GoogleFonts.poppins(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primaryColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        )
      ],
    );
  }

  Widget _uangSaku() {
    return formInput(
        controller: controller.infoLingkunganKeluarga['uangSaku'],
        title: "Uang Saku",
        placeholder: "Masukkan uang sakumu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan uang sakumu';
          }
          return null;
        });
  }

  Widget _transportasiSekolah() {
    return formInput(
        controller: controller.infoLingkunganKeluarga['transportSekolah'],
        title: "Transportasi ke Sekolah",
        placeholder: "Masukkan transportasi ke sekolah",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan transportasi ke sekolah';
          }
          return null;
        });
  }

  Widget _masalahBelajar() {
    return formInput(
        controller: controller.infoLingkunganKeluarga['masalah'],
        title: "Masalah yang sering mengganggu konsentrasi belajar",
        placeholder: "Masukkan masalahmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan masalahmu';
          }
          return null;
        });
  }
}
