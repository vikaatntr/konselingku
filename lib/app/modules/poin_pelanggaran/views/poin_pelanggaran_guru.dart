import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class poinPelanggaran extends StatelessWidget {
  const poinPelanggaran({Key? key}) : super(key: key);

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
          _title1(),
          SizedBox(height: 30),
          _title2(),
          SizedBox(height: 30),
          _title3(),
          SizedBox(height: 40),
          _buttonNext()
        ],
      )),
    );
  }

  Widget _title1() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Kesopanan",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
                margin: const EdgeInsets.only(left: 130),
                child: Text(
                  "Poin",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  "Pilih",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mencela, menghina dan berbuat tidak sopan kepada teman",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Berkata-kata tidak senonoh kepada siapapun",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa peralatan judi (dadu dan kartu) kecuali untuk pelajaran",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Makan-makanan saat KBM dan saat istirahat di dalam kelas",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengganggu saat KBM dan ibadah",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membuat surat ijin palsu dan memalsu tanda tangan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa atau merokok, HP, sepeda motor",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "10",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengambil barang milik orang lain tanpa ijin",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Memakai anting-anting, gelang, bagi siswa pria",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengubah warna rambut tidak sesuai dengan warna aslinya dan memodif rambut",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Melindungi teman yang salah atau memberikan pernyataan palsu",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengubah pengumuman sekolah sehingga menimbulkan arti berbeda",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Keluar atau masuk kelas / sekolah dengan melompat jendela atau pagar",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengancam sesama teman",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengadu atau menyakiti teman sehingga berkelahi",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa, menyebarkan selebaran yang dapat meresahkan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa senjata tajam, senjata api (kecuali ada tugas tertentu dari sekolah)",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Menggunakan peralatan judi (berjudi)",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "31",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Meminta paksa kepada orang lain",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Terlibat tindak kriminal sampai berurusan dengan berwajb",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "100",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa, menggunakan dan mengedarkan narkoba dan obat terlarang",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "100",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membuang sampah tidak pada tempatnya atau membuat kotor ruang kelas dan lingkungan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Memalsu tanda tangan Kepala Sekolah / Guru",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "31",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Memalsu atau merubah nilai ulangan atau nilai rapor",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "31",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa minuman dan mengedarkan minuman keras",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "31",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Berkelahi atau main hakim sendiri",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengambil, merusak barang milik sekolah maupun milik Bapak/Ibu Guru",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "31",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa, menyaksikan gambar-gambar porno",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "31",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 39),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Berbuat asusila, sehingga mengakibatkan kehamilan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "100",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title2() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Kesopanan",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
                margin: const EdgeInsets.only(left: 130),
                child: Text(
                  "Poin",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  "Pilih",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Datang ke sekolah terlambat",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak membawa buku pelajaran sesuai jadwal",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Berada di luar kelas saat KBM, dengan tugas yang tidak jelas",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Mengganggu ketenangan KBM",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Membawa buku-buku bacaan selain buku pelajaran atau buku perpustakaan (misal: komik dan sejenisnya)",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak mengikuti pelajaran tanpa ijin",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak melaksanakan tugas harian di kelasnya",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak mengikuti kegiatan keagamaan yang bersifat wajib",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "20",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 35),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak masuk sekolah tanpa surat keterangan dari orang tua/wali atau meninggalkan sekolahan tanpa ijin",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak mengerjakan PR",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak mengikuti upacara bendera",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title3() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Kerapian",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
                margin: const EdgeInsets.only(left: 150),
                child: Text(
                  "Poin",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  "Pilih",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak memakai seragam sesuai dengan ketentuan (atribut tidak lengkap)",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak memasukkan baju",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak memakai kaos kaki sesuai ketentuan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak memakai ikat pinggang/warna tidak hitam",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak memakai sepatu sesuai dengan ketentuan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Berambut gondrong/panjang untuk siswa putra dan berkuku panjang",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Berhias secara berlebihan dan berpakaian minim tidak sesuai dengan peraturan sekolah",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  "Tidak menjaga kebersihan meja, kursi dan lingkungan sekolah",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  "5",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 43),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonNext() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Selanjutnya",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
        ),
      ),
    );
  }
}
