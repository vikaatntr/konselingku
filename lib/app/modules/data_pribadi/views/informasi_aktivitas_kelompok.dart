import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

class AktivitasKelompokView extends GetView<DataPribadiController> {
  const AktivitasKelompokView({Key? key}) : super(key: key);

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
          "Aktivitas Kelompok",
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Feather.check,
              color: AppColors.black,
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
          _kedudukanKelompok(),
          const SizedBox(height: 20),
          _keterlibatanKelompok(),
          const SizedBox(height: 20),
          _kedisiplinanKelompok(),
          const SizedBox(height: 20),
          _kerjasamaKelompok()
        ],
      )),
    );
  }

  Widget _kedudukanKelompok() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kedudukan dalam Kelompok",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Populer")),
            DropdownMenuItem(value: 1, child: Text("Rata-rata")),
            DropdownMenuItem(value: 2, child: Text("Kurang Populer")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Kedudukan dalam Kelompok",
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

  Widget _keterlibatanKelompok() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keterlibatan dalam Kelompok Kerja",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Pemimpin")),
            DropdownMenuItem(value: 1, child: Text("Pencetus Ide")),
            DropdownMenuItem(value: 2, child: Text("Pengikut")),
            DropdownMenuItem(value: 3, child: Text("Pengacau")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Keterlibatan dalam Kelompok Kerja",
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

  Widget _kedisiplinanKelompok() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kedisiplinan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Taat Aturan")),
            DropdownMenuItem(value: 1, child: Text("Setuju Aturan")),
            DropdownMenuItem(value: 2, child: Text("Melawan Aturan")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Kedisiplinan",
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

  Widget _kerjasamaKelompok() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kerjasama dalam Kelompok dan Kelas",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Mementingkan kelasnya/kebersamaan")),
            DropdownMenuItem(value: 1, child: Text("Mementingkan teman tertentu")),
            DropdownMenuItem(value: 2, child: Text("Mementingkan diri sendiri")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Kerjasama dalam Kelompok dan Kelas",
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
}
