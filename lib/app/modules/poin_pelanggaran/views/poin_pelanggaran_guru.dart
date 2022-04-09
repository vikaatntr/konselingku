import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/controllers/poin_pelanggaran_controller.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/views/value_poin.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class PoinPelanggaranSiswa extends GetView<PoinPelanggaranController> {
  PoinPelanggaranSiswa({Key? key}) : super(key: key);

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
          const SizedBox(height: 30),
          _title2(),
          const SizedBox(height: 30),
          _title3(),
          const SizedBox(height: 40),
          _buttonNext()
        ],
      )),
    );
  }

  final RxList<int> valueKelakuan =
      RxList(List.generate(listKelakuan.length, (i) => 0));
  Widget _title1() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Kelakuan",
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
        for (var i = 0; i < listKelakuan.length; i++)
          _poinValue(listKelakuan.entries.toList()[i], i, "Kelakuan")
      ],
    );
  }

  Widget _poinValue(MapEntry<String, int> poin, int index, String kategori) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              poin.key,
              style: GoogleFonts.poppins(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              poin.value.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => Radio<int>(
                  toggleable: true,
                  value: poin.value,
                  groupValue: kategori == "Kelakuan"
                      ? valueKelakuan[index]
                      : kategori == "Kerajinan"
                          ? valueKerajinan[index]
                          : valueKerapian[index],
                  activeColor: Colors.green,
                  onChanged: (val) {
                    switch (kategori) {
                      case "Kelakuan":
                        valueKelakuan[index] = val ?? 0;
                        break;
                      case "Kerajinan":
                        valueKerajinan[index] = val ?? 0;
                        break;
                      case "Kerapian":
                        valueKerapian[index] = val ?? 0;
                        break;
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  final RxList<int> valueKerajinan =
      RxList(List.generate(listKerajinan.length, (i) => 0));
  Widget _title2() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Kerajinan",
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
        for (var i = 0; i < listKerajinan.length; i++)
          _poinValue(listKerajinan.entries.toList()[i], i, "Kerajinan")
      ],
    );
  }

  final RxList<int> valueKerapian =
      RxList(List.generate(listKerajinan.length, (i) => 0));
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
        for (var i = 0; i < listKerapian.length; i++)
          _poinValue(listKerapian.entries.toList()[i], i, "Kerapian")
      ],
    );
  }

  Widget _buttonNext() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            controller.submitPoin(valueKelakuan, valueKerajinan, valueKerapian,
                (Get.arguments as UserData).email);
          },
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
