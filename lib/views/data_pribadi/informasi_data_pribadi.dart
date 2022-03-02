import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/widgets/general/form_input.dart';

class infoDataPribadi extends StatelessWidget {
  const infoDataPribadi({Key? key}) : super(key: key);

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
          "Data Pribadi",
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
          _alamatInput(),
          SizedBox(height: 20),
          _distanceInput(),
          SizedBox(height: 20),
          _asalSekolahInput(),
          SizedBox(height: 20),
          _kelasInput(),
          SizedBox(height: 20),
          _graduateInput(),
          SizedBox(height: 20),
          _nilaiInput(),
          SizedBox(height: 20),
          _hobbyInput(),
          SizedBox(height: 20),
          _favPelajaranInput(),
          SizedBox(height: 20),
          _citaInput(),
          SizedBox(height: 20),
          _nisnInput(),
          SizedBox(height: 20),
          _bbInput(),
          SizedBox(height: 20),
          _tbInput()
        ],
      )),
    );
  }

  Widget _alamatInput() {
    return formInput(
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
