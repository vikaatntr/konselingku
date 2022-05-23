import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/kuesioner.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../controllers/kuesioner_controller.dart';

class HasilKuesioner extends GetView<KuesionerController> {
  const HasilKuesioner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Hasil Kuesioner'),
      body: controller.obx((state) => _body(state!)),
    );
  }

  Widget _body(Kuesioner kuesioner) {
    int problem = kuesioner.pertanyaan1
            .where((element) => element.values.first == 1)
            .length +
        kuesioner.pertanyaan2
            .where((element) => element.values.first == 1)
            .length +
        kuesioner.pertanyaan3
            .where((element) => element.values.first == 1)
            .length +
        kuesioner.pertanyaan4
            .where((element) => element.values.first == 1)
            .length;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _contentBox1(kuesioner.dateCreated.toDate().toString()),
          const SizedBox(height: 20),
          _contentBox2(
              problem,
              problem / kuesioner.pertanyaan1.length +
                  kuesioner.pertanyaan2.length +
                  kuesioner.pertanyaan3.length +
                  kuesioner.pertanyaan4.length),
          const SizedBox(height: 20),
          _subtitle(),
          const SizedBox(height: 15),
          _title1(),
          const SizedBox(height: 10),
          _content1(kuesioner.pertanyaan1
              .where((element) => element.values.first == 1)
              .toList()),
          const SizedBox(height: 20),
          _title2(),
          const SizedBox(height: 10),
          _content2(kuesioner.pertanyaan2
              .where((element) => element.values.first == 1)
              .toList()),
          const SizedBox(height: 20),
          _title3(),
          const SizedBox(height: 10),
          _content3(kuesioner.pertanyaan3
              .where((element) => element.values.first == 1)
              .toList()),
          const SizedBox(height: 20),
          _title4(),
          const SizedBox(height: 10),
          _content4(kuesioner.pertanyaan4
              .where((element) => element.values.first == 1)
              .toList()),
        ],
      )),
    );
  }

  Widget _contentBox1(String date) {
    return Container(
      width: Get.width,
      height: 170,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.green,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Selamat, Kamu telah menyelesaikan Kuesioner",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBlue),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Kamu sudah menyelesaikan kuesioner pada tanggal ${date.split('.')[0]}",
              style: GoogleFonts.poppins(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _contentBox2(int masalah, double presentase) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.kRed,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: Text(
                    "Jumlah Masalah",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "$masalah",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: Text(
                    "Presentase",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "${presentase.toStringAsFixed(presentase.toString().split('.')[1].contains("0") ? 0 : 2)} %",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _subtitle() {
    return Text(
      "Permasalahan yang dialami : ",
      style: GoogleFonts.poppins(fontSize: 17),
    );
  }

  Widget _title1() {
    return Text(
      "Bidang Pribadi",
      style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
    );
  }

  Widget _content1(List<Map<String, int>> masalah) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in masalah)
          Text(
            "- ${item.keys.first}",
            style: GoogleFonts.poppins(),
          ),
      ],
    );
  }

  Widget _title2() {
    return Text(
      "Bidang Sosial",
      style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
    );
  }

  Widget _content2(List<Map<String, int>> masalah) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in masalah)
          Text(
            "- ${item.keys.first}",
            style: GoogleFonts.poppins(),
          ),
      ],
    );
  }

  Widget _title3() {
    return Text(
      "Bidang Sosial",
      style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
    );
  }

  Widget _content3(List<Map<String, int>> masalah) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in masalah)
          Text(
            "- ${item.keys.first}",
            style: GoogleFonts.poppins(),
          ),
      ],
    );
  }

  Widget _title4() {
    return Text(
      "Bidang Pribadi",
      style: GoogleFonts.poppins(fontSize: 17, color: AppColors.darkBlue),
    );
  }

  Widget _content4(List<Map<String, int>> masalah) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var item in masalah)
          Text(
            "- ${item.keys.first}",
            style: GoogleFonts.poppins(),
          ),
      ],
    );
  }
}
