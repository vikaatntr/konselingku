import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/kuesioner.dart';
import 'package:konselingku/app/modules/kuesioner/controllers/list_kuesioner_controller.dart';
import 'package:konselingku/app/modules/kuesioner/views/hasil_kuesioner_from_list.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class ListKuesioner extends GetView<ListKuesionerController> {
  const ListKuesioner({Key? key}) : super(key: key);

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
                          _kuesioner(item),
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
        child: Text("Siswa belum menjawab kuesioner"),
      ),
      onLoading: const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (message) => Center(
        child: Text(message!),
      ),
    );
  }

  Widget _kuesioner(Kuesioner kuesioner) {
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
                            kuesioner.user!.namaLengkap,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            kuesioner.dateCreated
                                .toDate()
                                .toString()
                                .split('.')[0],
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 90),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                          () => HasilKuesionerFromList(kuesioner: kuesioner));
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
