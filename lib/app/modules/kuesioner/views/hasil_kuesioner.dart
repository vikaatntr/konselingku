import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class hasilKuesioner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Hasil Kuesioner'),
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
          _contentBox1(),
          SizedBox(height: 20),
          _contentBox2(),
          SizedBox(height: 20),
          _subtitle(),
          SizedBox(height: 15),
          _title1(),
          SizedBox(height: 10),
          _content1(),
          SizedBox(height: 20),
          _title2(),
          SizedBox(height: 10),
          _content2(),
          SizedBox(height: 20),
          _title3(),
          SizedBox(height: 10),
          _content3(),
          SizedBox(height: 20),
          _title4(),
          SizedBox(height: 10),
          _content4(),
        ],
      )),
    );
  }

  Widget _contentBox1() {
    return Container(
      width: Get.width,
      height: 170,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.kGreen,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              child: Text(
                "Selamat, Kamu telah menyelesaikan Kuesioner",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBlue),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              child: Text(
                "Kamu sudah menyelesaikan kuesioner pada tanggal 03 Maret 2022 pukul 19.32",
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentBox2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 165,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.kRed,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Container(
                  child: Text(
                    "Jumlah Masalah",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "40",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 165,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.kYellow,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Container(
                  child: Text(
                    "Presentase",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "80 %",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _subtitle() {
    return Container(
      child: Text(
        "Permasalahan yang dialami : ",
        style: GoogleFonts.poppins(fontSize: 17),
      ),
    );
  }

  Widget _title1() {
    return Container(
      child: Text(
        "Bidang Pribadi",
        style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
      ),
    );
  }

  Widget _content1() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }

  Widget _title2() {
    return Container(
      child: Text(
        "Bidang Sosial",
        style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
      ),
    );
  }

  Widget _content2() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }

  Widget _title3() {
    return Container(
      child: Text(
        "Bidang Sosial",
        style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
      ),
    );
  }

  Widget _content3() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }

  Widget _title4() {
    return Container(
      child: Text(
        "Bidang Pribadi",
        style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
      ),
    );
  }

  Widget _content4() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
          Text(
            "- Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
