import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/modules/admin_home/views/detail_user.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class listUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Daftar Akun Siswa'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listUser(),
        ],
      )),
    );
  }

  Widget _listUser() {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  "Vika Kusuma Dyah Tantri",
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(width: 180),
                GestureDetector(
                    onTap: () {
                      Get.to(detailUser());
                    },
                    child: Icon(Feather.chevron_right))
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(
          height: 5,
          color: AppColors.grey,
        )
      ],
    );
  }
}
