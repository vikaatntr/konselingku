// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/modules/kuesioner/views/soal.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

import '../controllers/kuesioner_controller.dart';

class KuesionerView extends GetView<KuesionerController> {
  const KuesionerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Kuesioner'),
      body: controller.obx((state) {
        print(state);
        return _bodySubmitted();
      },
          onEmpty: _body(),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          )),
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

  Widget _bodySubmitted() {
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
        ],
      )),
    );
  }

  Widget _soal(String soal, int index, int value, int pertanyaan) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          SizedBox(
            width: 230,
            child: Text(
              soal,
              style: GoogleFonts.poppins(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 17),
            child: Radio<int>(
                value: 1,
                groupValue: value,
                activeColor: Colors.green,
                onChanged: (val) {
                  switch (pertanyaan) {
                    case 1:
                      controller.listValuePertanyaan1[index] = val!;
                      break;
                    case 2:
                      controller.listValuePertanyaan2[index] = val!;
                      break;
                    case 3:
                      controller.listValuePertanyaan3[index] = val!;
                      break;
                    case 4:
                      controller.listValuePertanyaan4[index] = val!;
                      break;
                  }
                }),
          ),
          Container(
            margin: const EdgeInsets.only(left: 17),
            child: Radio<int>(
                value: 2,
                groupValue: value,
                activeColor: Colors.green,
                onChanged: (val) {
                  switch (pertanyaan) {
                    case 1:
                      controller.listValuePertanyaan1[index] = val!;
                      break;
                    case 2:
                      controller.listValuePertanyaan2[index] = val!;
                      break;
                    case 3:
                      controller.listValuePertanyaan3[index] = val!;
                      break;
                    case 4:
                      controller.listValuePertanyaan4[index] = val!;
                      break;
                  }
                }),
          ),
        ],
      ),
    );
  }

  Widget _title1() {
    return Column(
      children: [
        Row(
          children: [
            Text("Pernyataan 1",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            Container(
              margin: const EdgeInsets.only(left: 140),
              child: const Icon(
                Feather.check,
                color: Colors.green,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Icon(
                Feather.x,
                color: Colors.red,
              ),
            )
          ],
        ),
        for (var i = 0; i < pertanyaan1.length; i++)
          Obx(() =>
              _soal(pertanyaan1[i], i, controller.listValuePertanyaan1[i], 1))
      ],
    );
  }

  Widget _title2() {
    return Column(
      children: [
        Row(
          children: [
            Text("Pernyataan 2",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            Container(
              margin: const EdgeInsets.only(left: 140),
              child: const Icon(
                Feather.check,
                color: Colors.green,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Icon(
                Feather.x,
                color: Colors.red,
              ),
            )
          ],
        ),
        for (var i = 0; i < pertanyaan2.length; i++)
          Obx(() =>
              _soal(pertanyaan2[i], i, controller.listValuePertanyaan2[i], 2))
      ],
    );
  }

  Widget _title3() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Pernyataan 3",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(left: 140),
              child: const Icon(
                Feather.check,
                color: Colors.green,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Icon(
                Feather.x,
                color: Colors.red,
              ),
            ),
          ],
        ),
        for (var i = 0; i < pertanyaan3.length; i++)
          Obx(() =>
              _soal(pertanyaan3[i], i, controller.listValuePertanyaan3[i], 3))
      ],
    );
  }

  Widget _title4() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Pernyataan 4",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(left: 140),
              child: const Icon(
                Feather.check,
                color: Colors.green,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Icon(
                Feather.x,
                color: Colors.red,
              ),
            ),
          ],
        ),
        for (var i = 0; i < pertanyaan4.length; i++)
          Obx(() =>
              _soal(pertanyaan4[i], i, controller.listValuePertanyaan4[i], 4))
      ],
    );
  }

  Widget _buttonNext() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            if (controller.listValuePertanyaan1.contains(0) ||
                controller.listValuePertanyaan2.contains(0) ||
                controller.listValuePertanyaan3.contains(0) ||
                controller.listValuePertanyaan4.contains(0)) {
              Get.snackbar("Oops!", "Terdapat pertanyaan yang belum di jawab");
            } else {
              await controller.submit();
            }
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
