import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:konselingku/routes/pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _onSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxHeight: Get.height,
          maxWidth: Get.width,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.15),
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

  _onSplash() {
    return Timer(Duration(milliseconds: 1500), () {
      Get.offAllNamed(AppPages.MAIN);
    });
  }
}
