import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../controllers/guru_rekap_counseling_controller.dart';

class GuruRekapCounselingView extends GetView<GuruRekapCounselingController> {
  const GuruRekapCounselingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Permintaan Konseling'),
      body: _body(),
    );
  }

  Widget _body() {
    return controller.obx(
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
                          _counselingStatus(item),
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
        child: Text("Siswa belum melakukan konseling"),
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (message) => Center(
        child: Text(message!),
      ),
    );
  }

  Widget _counselingStatus(Counseling counseling) {
    UserData siswa = UserRepository.instance.listUser!
        .where((e) => e.email == counseling.emailSiswa)
        .single;
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: 110,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            siswa.namaLengkap,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            counseling.date,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "Status : ",
                                style: GoogleFonts.poppins(),
                              ),
                              Text(
                                counseling.status,
                                style: GoogleFonts.poppins(
                                    color: counseling.status == "Menunggu"
                                        ? AppColors.kYellow
                                        : counseling.status == "Ditolak"
                                            ? AppColors.kRed
                                            : AppColors.green),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 90),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.GURU_FORM_APPOINTMENT, arguments: {
                        'counseling': counseling,
                        'siswa': siswa
                      });
                    },
                    child: const Icon(
                      Feather.chevron_right,
                      color: AppColors.grey,
                      size: 35,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
