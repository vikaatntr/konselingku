import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

class InfoDataOrtuView extends GetView<DataPribadiController> {
  const InfoDataOrtuView({Key? key}) : super(key: key);

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
          "Data Orang Tua",
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        actions: [
          InkWell(
            onTap: () {
              controller.saveInfoOrangtua();
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
          _title1(),
          const SizedBox(height: 15),
          _namaAyahInput(),
          const SizedBox(height: 20),
          _alamatAyahInput(),
          const SizedBox(height: 20),
          _agamaAyahInput(),
          const SizedBox(height: 20),
          _pendidikanAyahInput(),
          const SizedBox(height: 20),
          _pekerjaaanAyahInput(),
          const SizedBox(height: 25),
          _title2(),
          const SizedBox(height: 15),
          _namaIbuInput(),
          const SizedBox(height: 20),
          _alamatIbuInput(),
          const SizedBox(height: 20),
          _agamaIbuInput(),
          const SizedBox(height: 20),
          _pendidikanIbuInput(),
          const SizedBox(height: 20),
          _pekerjaaanIbuInput(),
          const SizedBox(height: 25),
          _title3(),
          const SizedBox(height: 15),
          _namaWaliInput(),
          const SizedBox(height: 20),
          _alamatWaliInput(),
          const SizedBox(height: 20),
          _agamaWaliInput(),
          const SizedBox(height: 20),
          _pendidikanWaliInput(),
          const SizedBox(height: 20),
          _pekerjaaanWaliInput()
        ],
      )),
    );
  }

  Widget _title1() {
    return Text("1. Data Ayah",
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18));
  }

  Widget _namaAyahInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['ayah.nama'],
        title: "Nama Ayah",
        placeholder: "Masukkan nama ayahmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nama ayahmu';
          }
          return null;
        });
  }

  Widget _alamatAyahInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['ayah.alamat'],
        title: "Alamat Rumah",
        placeholder: "Masukkan alamat rumah ayahmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan alamat rumah ayahmu';
          }
          return null;
        });
  }

  Widget _agamaAyahInput() {
    //dropdown agama
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Agama",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaAyah,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Islam")),
            DropdownMenuItem(value: 1, child: Text("Kristen")),
            DropdownMenuItem(value: 2, child: Text("Katolik")),
            DropdownMenuItem(value: 3, child: Text("Hindu")),
            DropdownMenuItem(value: 4, child: Text("Budha")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaAyah = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Agama",
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

  Widget _pendidikanAyahInput() {
    //dropdown
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pendidikan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.pendAyah,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("SD")),
            DropdownMenuItem(value: 1, child: Text("SLTP")),
            DropdownMenuItem(value: 2, child: Text("SLTA")),
            DropdownMenuItem(value: 3, child: Text("Diploma")),
            DropdownMenuItem(value: 4, child: Text("Sarjana")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.pendAyah = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Pendidikan Terakhir Ayah",
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

  Widget _pekerjaaanAyahInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['ayah.pekerjaan'],
        title: "Pekerjaan",
        placeholder: "Masukkan pekerjaan ayahmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pekerjaan ayahmu';
          }
          return null;
        });
  }

  Widget _title2() {
    return Text("2. Data Ibu",
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18));
  }

  Widget _namaIbuInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['ibu.nama'],
        title: "Nama Ibu",
        placeholder: "Masukkan nama ibumu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nama ibumu';
          }
          return null;
        });
  }

  Widget _alamatIbuInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['ibu.alamat'],
        title: "Alamat Rumah",
        placeholder: "Masukkan alamat rumah ibumu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan alamat rumah ibumu';
          }
          return null;
        });
  }

  Widget _agamaIbuInput() {
    //dropdown agama
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Agama",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaIbu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Islam")),
            DropdownMenuItem(value: 1, child: Text("Kristen")),
            DropdownMenuItem(value: 2, child: Text("Katolik")),
            DropdownMenuItem(value: 3, child: Text("Hindu")),
            DropdownMenuItem(value: 4, child: Text("Budha")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaIbu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Agama",
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

  Widget _pendidikanIbuInput() {
    //dropdown
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pendidikan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.pendIbu,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("SD")),
            DropdownMenuItem(value: 1, child: Text("SLTP")),
            DropdownMenuItem(value: 2, child: Text("SLTA")),
            DropdownMenuItem(value: 3, child: Text("Diploma")),
            DropdownMenuItem(value: 4, child: Text("Sarjana")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.pendIbu = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Pendidikan Terakhir Ibu",
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

  Widget _pekerjaaanIbuInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['ibu.pekerjaan'],
        title: "Pekerjaan",
        placeholder: "Masukkan pekerjaan ibumu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pekerjaan ibumu';
          }
          return null;
        });
  }

  Widget _title3() {
    return Text("3. Data Wali",
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18));
  }

  Widget _namaWaliInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['wali.nama'],
        title: "Nama Wali",
        placeholder: "Masukkan nama walimu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nama walimu';
          }
          return null;
        });
  }

  Widget _alamatWaliInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['wali.alamat'],
        title: "Alamat Rumah",
        placeholder: "Masukkan alamat rumah walimu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan alamat rumah walimu';
          }
          return null;
        });
  }

  Widget _agamaWaliInput() {
    //dropdown agama
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Agama",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.agamaWali,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Islam")),
            DropdownMenuItem(value: 1, child: Text("Kristen")),
            DropdownMenuItem(value: 2, child: Text("Katolik")),
            DropdownMenuItem(value: 3, child: Text("Hindu")),
            DropdownMenuItem(value: 4, child: Text("Budha")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.agamaWali = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Agama",
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

  Widget _pendidikanWaliInput() {
    //dropdown
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pendidikan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.pendWali,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("SD")),
            DropdownMenuItem(value: 1, child: Text("SLTP")),
            DropdownMenuItem(value: 2, child: Text("SLTA")),
            DropdownMenuItem(value: 3, child: Text("Diploma")),
            DropdownMenuItem(value: 4, child: Text("Sarjana")),
          ],
          onChanged: (val) {
            if (val != null) {
              controller.pendWali = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Pendidikan Terakhir Ibu",
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

  Widget _pekerjaaanWaliInput() {
    return formInput(
        controller: controller.infoOrangTuaTextController['wali.pekerjaan'],
        title: "Pekerjaan",
        placeholder: "Masukkan pekerjaan ibumu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pekerjaan ibumu';
          }
          return null;
        });
  }
}
