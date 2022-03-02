import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';

class homePageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
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
      padding: EdgeInsets.fromLTRB(15, 15, 15, 30),
      child: Form(
          child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            // SizedBox(height: 10),
            _subtitle(),
            SizedBox(height: 20),
            _warningBox(),
            SizedBox(height: 20),
            _titleMenuApp(),
            SizedBox(height: 20),
            _menuApp()
          ],
        ),
      )),
    );
  }

  Widget _title() {
    return Container(
      // padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Text(
            "Halo Admin!",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      child: Column(
        children: [
          Text("Pengelolan akun konselingku", style: GoogleFonts.poppins()),
        ],
      ),
    );
  }

  Widget _warningBox() {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 85,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.kRed,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Lakukan pengelolaan akun pada aplikasi konselingku dengan baik dan benar",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    child: Icon(Feather.alert_triangle, size: 35, color: AppColors.pink,),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _titleMenuApp() {
    return Container(
      // padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Text(
            "Layanan Admin",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _menuApp() {
    return Container(
      child: Column(
        children: [
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
                        padding: EdgeInsets.only(top: 5),
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.yellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/images/student.png",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Daftar Akun Siswa",
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 5),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.kBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/images/protector.png",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Daftar Akun Wali Murid",
                        style: GoogleFonts.poppins(fontSize: 13),
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
                        padding: EdgeInsets.only(top: 5),
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/images/teacher.png",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Daftar Akun Guru",
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 5),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 5),
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.purple,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                        "Verifikasi Akun Guru",
                        style: GoogleFonts.poppins(fontSize: 13),
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
                        padding: EdgeInsets.only(top: 5),
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.brown,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/images/verification.png",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Verifikasi Akun Wali Murid",
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
