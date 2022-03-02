import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/widgets/general/form_input.dart';

class infoDataSiswa extends StatelessWidget {
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
          child: Icon(
            Feather.x,
            color: AppColors.black,
          ),
        ),
        title: Text(
          "Data Siswa",
          style: GoogleFonts.poppins(color: AppColors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
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
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _longNameInput(),
          SizedBox(height: 20),
          _nameInput(),
          SizedBox(height: 20),
          _emailInput(),
          SizedBox(height: 20),
          _phoneInput(),
          SizedBox(height: 20),
          // _titleJK(),
          _JKinput(),
          SizedBox(height: 20),
          _birthdaydateInput(),
          SizedBox(height: 20),
          _placebirthdayInput(),
          SizedBox(height: 20),
          _agamaInput(),
          SizedBox(height: 20),
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

  Widget _JKinput() {
    // Droplist jenis kelamin
    return formInput(
        title: "Jenis Kelamin",
        placeholder: "Masukkan jenis kelaminmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan jenis kelaminmu terlebih dahulu';
          }
          return null;
        });
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
    return formInput(
        title: "Agama",
        placeholder: "Masukkan agamamu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan agamamu terlebih dahulu';
          }
          return null;
        });
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
