import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../../../constant/colors.dart';
import '../../../data/model/user.dart';
import '../controllers/list_siswa.dart';

class ListUserView extends GetView<ListUserController> {
  const ListUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Data Pribadi Siswa"),
      body: controller.obx(
        (state) => state != null
            ? SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in state)
                        Column(
                          children: [
                            cardSiswa(item),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        )
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
        onEmpty: const Center(
          child: Text("Tidak ada siswa"),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (message) => Center(
          child: Text(message!),
        ),
      ),
    );
  }

  Widget cardSiswa(UserData siswa) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.MENU_DATA_PRIBADI, arguments: siswa);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.5),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            siswa.photoUrl == ""
                ? const SizedBox.shrink()
                : Image.network(siswa.photoUrl),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    siswa.namaLengkap,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
