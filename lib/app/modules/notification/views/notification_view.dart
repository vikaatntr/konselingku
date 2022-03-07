import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Notifikasi'),
      body: _body(),
    );
  }

  Widget _body() {
    return Scrollbar(
        child: Column(
      children: [
        cardNotif(),
        cardNotif(),
        cardNotif(),
      ],
    ));
  }

  Widget cardNotif() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/menu1.png",
              height: 45,
              width: 45,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Vika telah menyetujui janji konseling.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
