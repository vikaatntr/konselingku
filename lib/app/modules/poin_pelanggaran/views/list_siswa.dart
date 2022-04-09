import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/controllers/poin_pelanggaran_controller.dart';

import '../../../constant/colors.dart';
import '../../../widget/general/app_bar.dart';

class ListSiswaPoinPelanggaran extends GetView<PoinPelanggaranController> {
  const ListSiswaPoinPelanggaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "List Kuesioner Siswa"),
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
                          _siswa(item),
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
        child: Text("Tidak ada siswa mendaftar"),
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (message) => Center(
        child: Text(message!),
      ),
    );
  }

  Widget _siswa(UserData siswa) {
    int jumlahPoin = 0;
    for (var element in siswa.poinPelanggaran.values) {
      element.forEach((key, value) {
        jumlahPoin += value;
      });
    }
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
                            siswa.namaLengkap,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Poin saat ini : " + jumlahPoin.toString(),
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 90),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Get.arguments, arguments: siswa);
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
