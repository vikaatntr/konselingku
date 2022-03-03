import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';

class homePageGuru extends StatelessWidget {

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
      // padding: EdgeInsets.only(top: 30),
      child: Form(
          child: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _boxTitle(),
            SizedBox(height: 20),
            _title(),
            SizedBox(height: 15),
            _menuApp()
          ],
        ),
      )),
    );
  }

  Widget _boxTitle() {
    return Stack(
      children: [
        Container(
          child: SizedBox(
            width: Get.width,
            height: 230,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [const Color(0xFFA54F39), Color(0xFFE08D78)],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 15, 30, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Halo Guru!",
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
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 120),
          child: SizedBox(
            width: 330,
            height: 190,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      "Dashboard Konseling",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ]),
                            child: Container(
                                padding: EdgeInsets.only(left: 5),
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
                            padding: EdgeInsets.only(top: 5),
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ]),
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
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
      padding: EdgeInsets.only(left: 15),
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
      ),
    );
  }
}