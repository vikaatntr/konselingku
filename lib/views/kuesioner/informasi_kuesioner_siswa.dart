import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/views/kuesioner/kuesioner.dart';
import 'package:konselingku/widgets/general/app_bar.dart';

class informationKuesionerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Kuesioner'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageInformation(),
            SizedBox(height: 25),
            _information1(),
            SizedBox(height: 170),
            _buttonNext()
          ],
        ),
      )),
    );
  }

  Widget _imageInformation() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Image.asset(
          'assets/images/info.png',
          height: 150,
        ),
      ),
    );
  }

  Widget _information1() {
    return Container(
      // padding: EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1. Hal ini bukanlah alat tes, tetapi angket yang berisi tentang berbagai masalah yang sering dihadapi siswa.",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          Text(
            "2. Jawaban anda akan sangat bermanfaat untuk membantu keberhasilan belajar pada sekolah ini.",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          Text(
            "3. Pilih jawaban yang paling sesuai dengan kondisi anda saat ini, dengan cara memilih opsi antara YA dan TIDAK.",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          Text(
            "4. Jawaban anda akan saya rahasiakan, untuk itu dimohon untuk fokus dan menjawab dengan sungguh-sungguh.",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          Text(
            "5. Selamat mengerjakan!",
            style: GoogleFonts.poppins(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buttonNext() {
    return Center(
      child: Container(
        child: SizedBox(
          width: 200,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Get.to(kuesionerPage());
            },
            child: Text(
              "Setuju dan Lanjutkan",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
