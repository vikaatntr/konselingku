import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/views/data_pribadi/menu_data_pribadi.dart';
import 'package:konselingku/widgets/general/app_bar.dart';

class homeDataPribadi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Data Pribadi'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _photoProfile(),
            SizedBox(height: 20),
            _profileName(),
            SizedBox(height: 35),
            _contentBox1(),
            SizedBox(height: 20),
            _contentBox2(),
            SizedBox(height: 20),
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
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/user.png",
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName() {
    return Container(
      child: Center(
          child: Text(
        "Vika Kusuma Dyah Tantri",
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15),
      )),
    );
  }

  Widget _contentBox1() {
    return GestureDetector(
      onTap: () {
        Get.to(menuDataPribadi());
      },
      child: Container(
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/info.png"),
              ),
              SizedBox(
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
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/shield.png"),
              ),
              SizedBox(
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
      onTap: () {},
      child: Container(
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: AppColors.kRed,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Image.asset("assets/images/exit.png"),
              ),
              SizedBox(
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
}
