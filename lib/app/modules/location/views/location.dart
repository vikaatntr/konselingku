import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class locationView extends StatelessWidget {
  const locationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Track Siswa"),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pictureBox1(),
            SizedBox(height: 20),
            _contentBox1(),
            _contentBox2()
          ],
        ),
      )),
    );
  }

  Widget _pictureBox1() {
    return Container(
      alignment: Alignment.center,
      height: 450,
      width: 450,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3)),
            ]),
        child: Image.asset("assets/images/maps.png"),
      ),
    );
  }

  Widget _contentBox1() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            "Halo Vika",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _contentBox2() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Text("Kamu sudah berada di lokasi yang sudah ditentukan, selamat belajar!", style: GoogleFonts.poppins(),)
        ],
      ),
    );
  }
}
