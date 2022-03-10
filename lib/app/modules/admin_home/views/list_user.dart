import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);

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
                const SizedBox(width: 180),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.DETAIL_USER);
                    },
                    child: const Icon(Feather.chevron_right))
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 5,
          color: AppColors.grey,
        )
      ],
    );
  }
}
