import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konselingku/app/constant/custom_icon.dart';
import 'package:konselingku/app/modules/auth/verifikasi/controllers/verifikasi_controller.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class VerifikasiView extends GetView<VerifikasiController> {
  const VerifikasiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Verifikasi Email', elevation: 0),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.verif),
            const Spacer(),
            Text(
              "Cek Email Anda!",
              style: Get.textTheme.headline4!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Spacer(),
            Text(
              "Link verifikasi telah dikirimkan melalui email yang telah kamu daftarkan, silahkan cek di bagian kotak masuk atau spam",
              style: Get.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
