import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

class RencanaMasaDepanView extends GetView<DataPribadiController> {
  const RencanaMasaDepanView({Key? key}) : super(key: key);

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
          "Rencana Masa Depan",
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        actions: [
          controller.isViewOnly
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    controller.saveInformasiMasaDepan();
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
          _pilihanSekolah(),
          const SizedBox(height: 20),
          _rencanaPendidikan(),
          const SizedBox(height: 20),
          _citaCita(),
          const SizedBox(height: 20),
          _keterkaitanCitaCita(),
          const SizedBox(height: 20),
          _dukunganOrtu(),
          const SizedBox(height: 20),
          _kemampuanOrtu()
        ],
      )),
    );
  }

  Widget _pilihanSekolah() {
    return formInput(
        controller: controller.infoRencanaMasaDepan['pilihanSekolah'],
        title: "Pilihan sekolah lanjutan setelah lulus",
        placeholder: "Masukkan pilihan sekolah lanjutan",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pilihan sekolah lanjutan';
          }
          return null;
        });
  }

  Widget _rencanaPendidikan() {
    return formInput(
        controller: controller.infoRencanaMasaDepan['rencanaPendidikan'],
        title: "Rencana pendidikan lanjutan setelah SLTA",
        placeholder: "Masukkan rencana pendidikan",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan rencana pendidikan';
          }
          return null;
        });
  }

  Widget _citaCita() {
    return formInput(
        controller: controller.infoRencanaMasaDepan['citaCita'],
        title: "Cita-cita",
        placeholder: "Masukkan cita-cita",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan cita-cita';
          }
          return null;
        });
  }

  Widget _keterkaitanCitaCita() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keterkaitan cita-cita dengan bakat, minat dan kemampuan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.keterkaitanMinatBakat,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Sangat Terkait")),
            DropdownMenuItem(value: 1, child: Text("Kurang Terkait")),
            DropdownMenuItem(value: 2, child: Text("Tidak Terkait")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.keterkaitanMinatBakat = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Keterkaitan cita-cita",
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

  Widget _dukunganOrtu() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dukungan orang tua terhadap cita-cita",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.dukunganOrtu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Sangat")),
            DropdownMenuItem(value: 1, child: Text("Kurang")),
            DropdownMenuItem(value: 2, child: Text("Tidak")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.dukunganOrtu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Dukungan orang tua",
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

  Widget _kemampuanOrtu() {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Kemampuan ekonomi/biaya orang tua untuk mewujudkan cita-cita",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.ekonomiCita,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Mampu")),
            DropdownMenuItem(value: 1, child: Text("Cukup")),
            DropdownMenuItem(value: 2, child: Text("Kurang")),
            DropdownMenuItem(value: 3, child: Text("Tidak Mampu")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.ekonomiCita = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Kemampuan ekonomi/biaya orang tua",
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
