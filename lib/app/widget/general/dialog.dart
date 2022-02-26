import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog {
  static void loadingDialog() {
    showDialog(
        context: Get.context!,
        builder: (context) => SizedBox(
              width: Get.width,
              height: Get.height,
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: const CircularProgressIndicator()),
              ),
            ));
  }
}
