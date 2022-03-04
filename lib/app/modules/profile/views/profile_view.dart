import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

import '../../../constant/colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Profil'),
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
            _photoProfile(),
            const SizedBox(height: 20),
            _profileName(),
            const SizedBox(height: 35),
            _contentBox1(),
            const SizedBox(height: 20),
            _contentBox2(),
            const SizedBox(height: 20),
            _contentBox3(),
          ],
        ),
      )),
    );
  }

  Widget _photoProfile() {
    return Stack(
      children: [
        Center(
          child: controller.user.photoUrl.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    controller.user.photoUrl,
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/user.png",
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _profileName() {
    return Center(
        child: Text(
      controller.user.namaLengkap,
      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
    ));
  }

  Widget _contentBox1() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/info.png"),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Informasi Pribadi",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  Text("Detail data kamu",
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: AppColors.grey))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentBox2() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/shield.png"),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keamanan",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  Text("Pengaturan Password",
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: AppColors.grey))
                ],
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
        controller.logOut();
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/exit.png"),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keluar",
                    style: GoogleFonts.poppins(fontSize: 15),
                  ),
                  Text("Keluar dari akunmu",
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: AppColors.grey))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
