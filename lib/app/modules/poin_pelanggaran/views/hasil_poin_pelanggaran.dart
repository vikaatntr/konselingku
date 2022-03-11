import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class hasilPoin extends StatelessWidget {
  const hasilPoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Poin Pelanggaran'),
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
          _subtitle(),
          SizedBox(height: 15),
          _content()
        ],
      )),
    );
  }

  Widget _contentBox1() {
    return Container(
      width: Get.width,
      height: 150,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.kRed,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              child: Text(
                "Jumlah Pelanggaran",
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBlue),
              ),
            ),
          ),
          Container(
            child: Text("30",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 45)),
          ),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      child: Text("Detail Pelanggaran",
          style: GoogleFonts.poppins(
              fontSize: 17,
              color: AppColors.darkBlue,
              fontWeight: FontWeight.w500)),
    );
  }

  Widget _content() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1.  Mengganggu saat KBM dan ibadah",
            style: GoogleFonts.poppins(),
          ),
          Text("poin : 10",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 5),
          Divider(height: 10, color: AppColors.darkGrey,),
          Text(
            "2.  Mengganggu saat KBM dan ibadah",
            style: GoogleFonts.poppins(),
          ),
          Text("poin : 10",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 5),
          Divider(height: 10, color: AppColors.darkGrey,),
          Text(
            "3.  Mengganggu saat KBM dan ibadah",
            style: GoogleFonts.poppins(),
          ),
          Text("poin : 10",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 5),
          Divider(height: 10, color: AppColors.darkGrey,),
        ],
      ),
    );
  }
}
