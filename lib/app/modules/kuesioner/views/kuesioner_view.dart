import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/modules/kuesioner/views/hasil_kuesioner.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../controllers/kuesioner_controller.dart';

class KuesionerView extends GetView<KuesionerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Kuesioner'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 15, 30),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title1(),
          const SizedBox(height: 30),
          _title2(),
          const SizedBox(height: 30),
          _title3(),
          const SizedBox(height: 30),
          _title4(),
          const SizedBox(height: 40),
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
              "Pernyataan 1",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              margin: EdgeInsets.only(left: 140),
              child: const Icon(
                Feather.check,
                color: Colors.green,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              child: const Icon(
                Feather.x,
                color: Colors.red,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Saya kadang lupa bersyukur atas nikmat dan karunia dari Tuhan YME",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Saya kadang lupa untuk berperilaku sopan dan santun dalam kehidupan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Saya merasa belum paham etika yang baik dan benar dalam pergaulan teman sebaya",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Saya merasa sulit mematuhi tata tertib di sekolah",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Kadang-kadang saya masih suka menyontek pada waktu ulangan",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Waktu saya banyak dihabiskan untuk bermain game atau games online",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Saya sulit meminta maaf jika melakukan kesalahan terhadap orang lain",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      log("Radio $val");
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(left: 17),
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
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  "Saya masih merasa belum memiliki rasa percaya diri",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya belum tahu cara mengendalikan emosi ",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya belum tahu cara melakukan eksplorasi bakat secara mandiri ",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya masih sering mengalami sakit / alergi ",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Kondisi keluarga saya sedang tidak harmonis",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya sedang mempunyai masalah dengan anggauta keluarga di rumah",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya merasa belum bisa menjadi pribadi yang mandiri",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya sering lupa waktu ketika bermain/membuka media sosial (fb, wa, instagram, dll)",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Container(
                width: 230,
                child: Text(
                  "Saya merasa sulit mengendalikan ketergantungan dengan handphone",
                  style: GoogleFonts.poppins(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      print("Radio $val");
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _title2() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Pernyataan 2",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Container(
                margin: EdgeInsets.only(left: 140),
                child: Icon(
                  Feather.check,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Icon(
                  Feather.x,
                  color: Colors.red,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa tidak betah tinggal di rumah sendiri",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa tidak pernah di perhatikan dari orang tua ",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Kata maaf, tolong dan terimakasih kadang lupa saya ucapkan dalam pergaulan",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum tahu tentang bentuk-bentuk kenakalan remaja saat ini dan cara mensikapinya",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya sering beda pendapat dengan orang lain",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya sedang mempunyai masalah dengan teman di sekolah",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum tahu cara untuk menjaga persahabatan agar tetap langgeng",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum tahu tentang bullying dan cara mensikapinya",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya sukar bergaul dengan teman-teman di sekolah",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa masih sedikit pemahaman tentang kesehatan reproduksi remaja",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum banyak tahu tentang dampak dari pacaran",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya malu jika membicarakan masalah seks dan pacar kepada orang tua",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa malu jika bergaul dengan teman yang beda jenis kelamin",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _title3() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Pernyataan 3",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                margin: EdgeInsets.only(left: 140),
                child: Icon(
                  Feather.check,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Icon(
                  Feather.x,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa takut bertanya atau menjawab di kelas",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum paham yang harus dilakuan dengan adanya pemanasan global",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum mengetahui banyak tentang jenis obat-obat terlarang serta dampaknya",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum tahu cara memilih lembaga bimbingan belajar",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa tidak memiliki semangat belajar ",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum tahu cara meraih prestasi di sekolah",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum paham tentang gaya belajar dan strategi yang sesuai dengannya",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa kesulitan dalam memahami pelajaran",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum terbiasa belajar bersama atau kelompok",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya merasa belum menenumkan cara belajar yang efektif",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya selalu malas untuk belajar di rumah",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belajarnya jika akan ada ulangan atau ujian saja",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Orang tua kurang peduli dengan kegiatan belajar saya",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum bisa membuat peta pikiran (mind mapping)",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum mengenal tentang macam-macam kecerdasan",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum paham cara kerja otak kiri dan otak kanan ",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _title4() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Pernyataan 4",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                margin: EdgeInsets.only(left: 140),
                child: Icon(
                  Feather.check,
                  color: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                child: Icon(
                  Feather.x,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya sering dimarahi orang tua karena boros",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya tidak terbiasa menabung",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya kurang dapat menyalurkan bakat dan minat di sekolah",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum tahu tentang prospek karir untuk setiap mapel",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Container(
                  width: 230,
                  child: Text(
                    "Saya belum banyak tahu tentang jenis-jenis profesi di masyarakat dan Prospeknya",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: 17),
                  child: Radio(
                      value: 1,
                      groupValue: 1,
                      activeColor: Colors.green,
                      onChanged: (val) {
                        print("Radio $val");
                      }),
                ),
              ],
            ),
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
              Get.to(hasilKuesioner());
            },
            child: Text(
              "Selanjutnya",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
