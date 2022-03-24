import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

import '../controllers/hasil_counseling_controller.dart';

class HasilCounselingView extends GetView<HasilCounselingController> {
  HasilCounselingView({Key? key}) : super(key: key);

  final Counseling counseling = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Rekap Konseling'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bidangInput(),
            const SizedBox(height: 20),
            _dateInput(),
            const SizedBox(height: 20),
            _timeInput(),
            const SizedBox(height: 20),
            _descriptionInput(),
          ],
        ),
      )),
    );
  }

  Widget _bidangInput() {
    //dropdown bidang
    return formInput(
        enabled: false,
        intialValue: counseling.bidang,
        title: "Permasalahan bidang apa yang akan dikonselingkan",
        placeholder: "Pilih permasalahan di bidang apa",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Pilih permasalahan di bidang apa';
          }
          return null;
        });
  }

  Widget _dateInput() {
    //pilih tanggal
    return formInput(
        enabled: false,
        intialValue: counseling.date,
        title: "Tanggal pelaksanaan konseling",
        placeholder: "Pilih tanggal",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan tanggal pelaksanaan konseling';
          }
          return null;
        });
  }

  Widget _timeInput() {
    // pilih waktu
    return formInput(
        enabled: false,
        title: "Waktu",
        intialValue: counseling.jam,
        placeholder: "Pilih waktu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan waktu pelaksanaan konsleing';
          }
          return null;
        });
  }

  Widget _descriptionInput() {
    return formInput(
        enabled: false,
        title: "Deskripsi permasalahan",
        intialValue: counseling.description,
        placeholder: "Masukkan deskripsi permasalahanmu",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan deskripsi permasalahanmu';
          }
          return null;
        });
  }
}
