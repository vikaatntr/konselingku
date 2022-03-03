import 'package:flutter/material.dart';
import 'package:konselingku/widgets/general/app_bar.dart';

class notificationPageWali extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Notifikasi'),
      body: _body(),
    );
  }

  Widget _body() {
    return Scrollbar(
        child: Container(
      child: Column(
        children: [
          cardNotif(),
          cardNotif(),
          cardNotif(),
        ],
      ),
    ));
  }

  Widget cardNotif() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Vika telah selesai melakukan janji konseling.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
