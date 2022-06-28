import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class MenuDataPribadiView extends StatelessWidget {
  const MenuDataPribadiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (UserRepository.instance.user!.role == "1") {
          Get.back();
          Get.back();
        }
        return true;
      },
      child: Scaffold(
        appBar: appBar(
            title: 'Informasi Pribadi',
            back: () {
              if (UserRepository.instance.user!.role == "1") {
                Get.back();
                Get.back();
              } else {
                Get.back();
              }
            }),
        body: _body(),
      ),
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
            _contentBox1(),
            const SizedBox(height: 20),
            _contentBox2(),
            const SizedBox(height: 20),
            _contentBox3(),
            const SizedBox(height: 20),
            _contentBox4(),
            const SizedBox(height: 20),
            _contentBox5(),
            const SizedBox(height: 20),
            _contentBox6(),
            const SizedBox(height: 20),
            _contentBox7()
          ],
        ),
      )),
    );
  }

  Widget _contentBox1() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_DATA_SISWA);
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Informasi Data Siswa",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Data siswa yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox2() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_DATA_SISWA_PRIBADI);
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Informasi Data Pribadi Siswa",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Data pribadi siswa yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox3() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_DATA_ORTU);
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Informasi Data Orang Tua",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Data orang tua yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox4() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_LINGKUNGAN_KELUARGA);
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Keterangan Lingkungan Keluarga",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Keterangan lingkungan keluarga yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox5() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_KONDISI_FISIK_PSIKIS);
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Informasi Kondisi Fisik dan Psikis",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Data kondisi fisik dan psikis yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox6() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_AKTIVITAS_KELOMPOK);
      },
      child: Container(
        height: 130,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Informasi Aktifitas dalam Kegiatan Kelompok",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Data aktifitas dalam kegiatan kelompok yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox7() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.FORM_RENCANA_MASADEPAN);
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Informasi Rencana Masa Depan",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              Text(
                "Data rencana masa depan yang diwajibkan diisi",
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
