import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/controllers/poin_pelanggaran_controller.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class HasilPoinPelanggaran extends GetView<PoinPelanggaranController> {
  HasilPoinPelanggaran({Key? key}) : super(key: key);

  final UserData siswa = Get.arguments;
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
          const SizedBox(height: 20),
          _subtitle(),
          const SizedBox(height: 15),
          for (var item in siswa.poinPelanggaran.entries)
            _content(item.key, item.value)
        ],
      )),
    );
  }

  Widget _contentBox1() {
    int jumlahPoin = 0;
    for (var element in siswa.poinPelanggaran.values) {
      element.forEach((key, value) {
        jumlahPoin += value;
      });
    }
    return Container(
      width: Get.width,
      height: 150,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.kRed,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Jumlah Pelanggaran",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkBlue),
            ),
          ),
          Text(jumlahPoin.toString(),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 45)),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return Text("Detail Pelanggaran",
        style: GoogleFonts.poppins(
            fontSize: 17,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w500));
  }

  Widget _content(String kategori, Map<String, int> pelanggaran) {
    var pelanggaranPoin = {};
    pelanggaran.forEach((key, value) {
      if (value > 0) {
        pelanggaranPoin[key] = value;
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          kategori,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        const Divider(
          height: 10,
          color: AppColors.darkGrey,
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < pelanggaranPoin.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${i + 1}.  ${pelanggaranPoin.keys.toList()[i]}",
                style: GoogleFonts.poppins(),
              ),
              Text("poin : ${pelanggaranPoin.values.toList()[i]}",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 5),
              const Divider(
                height: 10,
                color: AppColors.darkGrey,
              ),
            ],
          )
      ],
    );
  }
}
