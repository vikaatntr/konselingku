import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class ListUser extends GetView<AdminHomeController> {
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
        children: [for (var item in controller.listUser) _listUser(item)],
      )),
    );
  }

  Widget _listUser(UserData user) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.namaLengkap,
              style: GoogleFonts.poppins(),
            ),
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_USER, arguments: user);
                },
                child: const Icon(Feather.chevron_right))
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
