import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

class KondisiFisikPsikisView extends GetView<DataPribadiController> {
  const KondisiFisikPsikisView({Key? key}) : super(key: key);

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
          "Kondisi Fisik dan Psikis",
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        actions: [
          controller.isViewOnly
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    controller.saveKondisiFisikdanPsikis();
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
          _keadaanBadan(),
          const SizedBox(height: 20),
          _penyakitSiswa(),
          const SizedBox(height: 20),
          _gangguanIndera(),
          const SizedBox(height: 20),
          _gangguanFisik(),
          const SizedBox(height: 20),
          _tampilanEmosi()
        ],
      )),
    );
  }

  Widget _keadaanBadan() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keadaan Tampilan Badan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.keadaanBadan,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Tinggi")),
            DropdownMenuItem(value: 1, child: Text("Sedang")),
            DropdownMenuItem(value: 2, child: Text("Pendek")),
            DropdownMenuItem(value: 3, child: Text("Gemuk")),
            DropdownMenuItem(value: 4, child: Text("Sedang")),
            DropdownMenuItem(value: 5, child: Text("Kurus")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.keadaanBadan = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Keadaan Tampilan Badan",
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

  Widget _penyakitSiswa() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Penyakit yang Pernah Diderita",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.penyakit,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Typus")),
            DropdownMenuItem(value: 1, child: Text("Magh")),
            DropdownMenuItem(value: 2, child: Text("Jantung")),
            DropdownMenuItem(value: 3, child: Text("Anemia")),
            DropdownMenuItem(value: 4, child: Text("Sesak Napas")),
            DropdownMenuItem(value: 5, child: Text("Lainnya")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.penyakit = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Penyakit yang Pernah Diderita",
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

  Widget _gangguanIndera() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Gangguan Indera",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.gangguanIndera,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Mata")),
            DropdownMenuItem(value: 1, child: Text("Telinga")),
            DropdownMenuItem(value: 2, child: Text("Hidung")),
            DropdownMenuItem(value: 3, child: Text("Tenggorokan")),
            DropdownMenuItem(value: 4, child: Text("Kulit")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.gangguanIndera = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Gangguan Indera",
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

  Widget _gangguanFisik() {
    return formInput(
        controller: controller.infoKondisiFisikdanPsikis['gangguanFisik'],
        title: "Gangguan Fisik Lainnya",
        placeholder: "Masukkan Gangguan Fisik Lainnya",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan Gangguan Fisik Lainnya';
          }
          return null;
        });
  }

  Widget _tampilanEmosi() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tampilan emosi dan tingkah laku yang menonjol",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.tampilanEmosi,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Periang/mudah bergaul")),
            DropdownMenuItem(value: 1, child: Text("Pemurung/Pendiam")),
            DropdownMenuItem(value: 2, child: Text("Suka Mengganggu/Nakal")),
            DropdownMenuItem(value: 3, child: Text("Pemarah")),
            DropdownMenuItem(value: 4, child: Text("Cengeng")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.tampilanEmosi = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Tampilan emosi dan tingkah laku yang menonjol",
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
