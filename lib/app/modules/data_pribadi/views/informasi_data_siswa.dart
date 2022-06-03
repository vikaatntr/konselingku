import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import 'package:konselingku/app/modules/data_pribadi/controllers/data_pribadi_controller.dart';

class InfoDataSiswaView extends GetView<DataPribadiController> {
  InfoDataSiswaView({Key? key}) : super(key: key);

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
        actions: [
          controller.isViewOnly
              ? const SizedBox.shrink()
              : InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.saveInfoDataSiswa();
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
        enabled: !controller.isViewOnly,
        controller: controller.infoDataSiswaTextController['namaLengkap'],
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
        enabled: !controller.isViewOnly,
        controller: controller.infoDataSiswaTextController['namaPanggilan'],
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
        controller: controller.infoDataSiswaTextController['email'],
        enabled: false,
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
        enabled: !controller.isViewOnly,
        title: "No. Telepon",
        controller: controller.infoDataSiswaTextController['noTelp'],
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
          onChanged: controller.isViewOnly
              ? null
              : (val) {
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
        onTap: () async {
          if (!controller.isViewOnly) {
            FocusScope.of(Get.context!).requestFocus(FocusNode());
            DateTime? date = await showDatePicker(
              context: Get.context!,
              initialDate: DateTime.now(),
              firstDate: DateTime(1945),
              lastDate: DateTime.now(),
            );
            if (date != null) {
              controller.tanggalLahir = Timestamp.fromDate(date);
            }
          }
        },
        enabled: false,
        title: "Tanggal Lahir",
        controller: controller.infoDataSiswaTextController['tanggalLahir'],
        placeholder: "Masukkan tanggal lahirmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tanggal lahirmu terlebih dahulu';
          }
          if (value.toString().split('-')[0] ==
              DateTime.now().toString().split('-')[0]) {
            return "Tanggal Lahir belum diubah";
          }
          return null;
        });
  }

  Widget _placebirthdayInput() {
    return formInput(
        enabled: !controller.isViewOnly,
        title: "Tempat Lahir",
        placeholder: "Masukkan tempat lahirmu ",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        controller: controller.infoDataSiswaTextController['tempatLahir'],
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
          onChanged: controller.isViewOnly
              ? null
              : (val) {
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
        enabled: !controller.isViewOnly,
        title: "Facebook",
        placeholder: "Masukkan facebookmu",
        controller: controller.infoDataSiswaTextController['facebook'],
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
