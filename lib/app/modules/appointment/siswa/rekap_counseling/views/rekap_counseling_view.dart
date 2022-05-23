import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/counseling.dart';
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
        child: Text("Anda belum melakukan konseling"),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                            ? AppColors.red
                                            : AppColors.kGreen),
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
                      Get.toNamed(Routes.HASIL_COUNSELING,
                          arguments: counseling);
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
