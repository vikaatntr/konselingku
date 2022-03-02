import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/widgets/general/form_input.dart';

class infoDataOrtu extends StatelessWidget {
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
          "Data Orang Tua",
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
          _title1(),
          SizedBox(height: 15),
          _namaAyahInput(),
          SizedBox(height: 20),
          _alamatAyahInput(),
          SizedBox(height: 20),
          _agamaAyahInput(),
          SizedBox(height: 20),
          _pendidikanAyahInput(),
          SizedBox(height: 20),
          _pekerjaaanAyahInput(),
          SizedBox(height: 25),
          _title2(),
          SizedBox(height: 15),
          _namaIbuInput(),
          SizedBox(height: 20),
          _alamatIbuInput(),
          SizedBox(height: 20),
          _agamaIbuInput(),
          SizedBox(height: 20),
          _pendidikanIbuInput(),
          SizedBox(height: 20),
          _pekerjaaanIbuInput(),
          SizedBox(height: 25),
          _title3(),
          SizedBox(height: 15),
          _namaWaliInput(),
          SizedBox(height: 20),
          _alamatWaliInput(),
          SizedBox(height: 20),
          _agamaWaliInput(),
          SizedBox(height: 20),
          _pendidikanWaliInput(),
          SizedBox(height: 20),
          _pekerjaaanWaliInput()
        ],
      )),
    );
  }

  Widget _title1() {
    return Container(
        // padding: EdgeInsets.only(left: 15),
        child: Text("1. Data Ayah",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 18)));
  }

  Widget _namaAyahInput() {
    return formInput(
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
    return formInput(
        title: "Agama",
        placeholder: "Masukkan agama ayahmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan agama ayahmu';
          }
          return null;
        });
  }

  Widget _pendidikanAyahInput() {
    //dropdown
    return formInput(
        title: "Pendidikan",
        placeholder: "Masukkan pendidikan terakhir",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pendidikan terakhir';
          }
          return null;
        });
  }

  Widget _pekerjaaanAyahInput() {
    return formInput(
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
    return Container(
        // padding: EdgeInsets.only(left: 15),
        child: Text("2. Data Ibu",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 18)));
  }

  Widget _namaIbuInput() {
    return formInput(
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
    return formInput(
        title: "Agama",
        placeholder: "Masukkan agama ibumu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan agama ibumu';
          }
          return null;
        });
  }

  Widget _pendidikanIbuInput() {
    //dropdown
    return formInput(
        title: "Pendidikan",
        placeholder: "Masukkan pendidikan terakhir",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pendidikan terakhir';
          }
          return null;
        });
  }

  Widget _pekerjaaanIbuInput() {
    return formInput(
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
    return Container(
        // padding: EdgeInsets.only(left: 15),
        child: Text("3. Data Wali",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, fontSize: 18)));
  }

  Widget _namaWaliInput() {
    return formInput(
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
    return formInput(
        title: "Agama",
        placeholder: "Masukkan agama walimu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan agama walimu';
          }
          return null;
        });
  }

  Widget _pendidikanWaliInput() {
    //dropdown
    return formInput(
        title: "Pendidikan",
        placeholder: "Masukkan pendidikan terakhir",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan pendidikan terakhir';
          }
          return null;
        });
  }

  Widget _pekerjaaanWaliInput() {
    return formInput(
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
