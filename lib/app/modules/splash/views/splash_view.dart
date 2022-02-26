import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: Get.height,
          maxWidth: Get.width,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFFAFAFA),
        ),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.15),
              child: Image.asset(
                "assets/images/kons1.png",
                width: Get.width * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
