import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/routes/app_pages.dart';

import '../controllers/wali_home_controller.dart';

class WaliHomeView extends GetView<WaliHomeController> {
  const WaliHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/images/user.png"),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Feather.bell,
                color: AppColors.black,
              ),
            ),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      // padding: EdgeInsets.only(top: 30),
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _boxTitle(),
            const SizedBox(height: 20),
            _title(),
            const SizedBox(height: 15),
            _menuApp()
          ],
        ),
      )),
    );
  }

  Widget _boxTitle() {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: 230,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFA54F39), Color(0xFFE08D78)],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Halo Wali Murid!",
                    style: GoogleFonts.poppins(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                      "Yuk lakukan bimbingan konseling dengan konselor terbaikmu!",
                      style: GoogleFonts.poppins(
                          color: AppColors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 15))
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 120),
          child: SizedBox(
            width: 330,
            height: 190,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3)),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      "Dashboard Konseling",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3))
                                ]),
                            child: Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sudah Melakukan",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blue,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "5 kali",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.blue, fontSize: 12),
                                    ),
                                    Text(
                                      "Bimbingan Konseling",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blue,
                                          fontSize: 12),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3))
                                ]),
                            child: Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Poin Pelanggaran",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.red,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    "10 kali",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.red, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Layanan",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _menuApp() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PROFILE);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 100,
                      width: 180,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/menu1.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Janji Konseling",
                      style: GoogleFonts.poppins(),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LIST_KUESIONER);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 100,
                      width: 180,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.kBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/menu2.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Kuesioner",
                      style: GoogleFonts.poppins(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 100,
                      width: 180,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/menu3.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Poin Pelanggaran",
                      style: GoogleFonts.poppins(),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(top: 5),
                      height: 100,
                      width: 180,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/menu4.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Data Pribadi",
                      style: GoogleFonts.poppins(),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
