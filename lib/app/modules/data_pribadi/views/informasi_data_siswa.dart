import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

class InfoDataSiswaView extends GetView<DataPribadiController> {
  const InfoDataSiswaView({Key? key}) : super(key: key);

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
          "Data Siswa",
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
          _longNameInput(),
          const SizedBox(height: 20),
          _nameInput(),
          const SizedBox(height: 20),
          _emailInput(),
          const SizedBox(height: 20),
          _phoneInput(),
          const SizedBox(height: 20),
          // _titleJK(),
          _jKinput(),
          const SizedBox(height: 20),
          Obx(() => controller.jenisKelamin != 0
                      ? const SizedBox(height: 20)
                      : const SizedBox.shrink()),
          _birthdaydateInput(),
          const SizedBox(height: 20),
          _placebirthdayInput(),
          const SizedBox(height: 20),
          _agamaInput(),
          const SizedBox(height: 20),
          _facebookInput()
        ],
      )),
    );
  }

  Widget _longNameInput() {
    return formInput(
        title: "Nama Lengkap",
        placeholder: "Masukkan nama lengkapmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nama lengkapmu';
          }
          return null;
        });
  }

  Widget _nameInput() {
    return formInput(
        title: "Nama Panggilan",
        placeholder: "Masukkan nama panggilanmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nama panggilanmu';
          }
          return null;
        });
  }

  Widget _emailInput() {
    return formInput(
        title: "Email",
        placeholder: "Masukkan emailmu",
        inputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan emailmu terlebih dahulu';
          }
          return null;
        });
  }

  Widget _phoneInput() {
    return formInput(
        title: "No. Telepon",
        placeholder: "Masukkan nomer teleponmu",
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nomer teleponmu terlebih dahulu';
          }
          return null;
        });
  }

  // Widget _titleJK() {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     child: Text("Jenis Kelamin", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
  //   );
  // }

  Widget _jKinput() {
    // Droplist jenis kelamin
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Jenis Kelamin",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            )),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.jenisKelamin,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Laki-laki")),
            DropdownMenuItem(value: 1, child: Text("Perempuan"))
          ],
          onChanged: (val) {
            if (val != null) {
              controller.jenisKelamin = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Jenis Kelamin",
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

  Widget _birthdaydateInput() {
    // ada kalender untuk memilih tanggal lahir
    return formInput(
        title: "Tanggal Lahir",
        placeholder: "Masukkan tanggal lahirmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tanggal lahirmu terlebih dahulu';
          }
          return null;
        });
  }

  Widget _placebirthdayInput() {
    return formInput(
        title: "Tempat Lahir",
        placeholder: "Masukkan tempat lahirmu ",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tempat lahirmu terlebih dahulu';
          }
          return null;
        });
  }

  Widget _agamaInput() {
    // droplist agama
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
          value: controller.agamaSiswa,
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
              controller.agamaSiswa = val;
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

  Widget _facebookInput() {
    return formInput(
        title: "Facebook",
        placeholder: "Masukkan facebookmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan facebookmu terlebih dahulu';
          }
          return null;
        });
  }
}
