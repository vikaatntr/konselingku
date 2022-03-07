import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../controllers/rekap_counseling_controller.dart';

class RekapCounselingView extends GetView<RekapCounselingController> {
  const RekapCounselingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Rekap Konseling'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _comboBox1(),
            const SizedBox(height: 20),
            _comboBox2(),
            const SizedBox(height: 20),
            _comboBox3(),
          ],
        ),
      )),
    );
  }

  Widget _comboBox1() {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: 90,
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
                            "Jumat, 3 Maret 2020",
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
                                "Menunggu",
                                style: GoogleFonts.poppins(
                                    color: AppColors.kYellow),
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
                      Get.toNamed(Routes.HASIL_COUNSELING);
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

  Widget _comboBox2() {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: 90,
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
                            "Jumat, 3 Maret 2020",
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
                                "Ditolak",
                                style:
                                    GoogleFonts.poppins(color: AppColors.red),
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
                      Get.toNamed(Routes.HASIL_COUNSELING);
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

  Widget _comboBox3() {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: 90,
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
                            "Jumat, 3 Maret 2020",
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
                                "Diterima",
                                style: GoogleFonts.poppins(
                                    color: AppColors.kGreen),
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
                      Get.toNamed(Routes.HASIL_COUNSELING);
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
