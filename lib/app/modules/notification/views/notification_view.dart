import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:konselingku/app/data/model/notification.dart';
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
        for (var item in controller.appController.userData!.notification)
          cardNotif(item)
      ],
    ));
  }

  Widget cardNotif(AppNotification notif) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: notif.isRead ? null : Colors.pink.withOpacity(.1),
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
          Expanded(
            child: Text(
              notif.message,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
