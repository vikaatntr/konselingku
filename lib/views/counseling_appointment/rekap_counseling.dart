import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/views/counseling_appointment/hasil_konseling.dart';
import 'package:konselingku/widgets/general/app_bar.dart';

class rekapKonseling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Rekap Konseling'),
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
            _comboBox1(),
            SizedBox(height: 20),
            _comboBox2(),
            SizedBox(height: 20),
            _comboBox3(),
          ],
        ),
      )),
    );
  }

  Widget _comboBox1() {
    return Stack(
      children: [
        Container(
          width: Get.width,
          height: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
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
                  SizedBox(width: 90),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(hasilKonseling());
                      },
                      child: Icon(
                        Feather.chevron_right,
                        color: AppColors.grey,
                        size: 35,
                      ),
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
        Container(
          width: Get.width,
          height: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
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
                  SizedBox(width: 90),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(hasilKonseling());
                      },
                      child: Icon(
                        Feather.chevron_right,
                        color: AppColors.grey,
                        size: 35,
                      ),
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
        Container(
          width: Get.width,
          height: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
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
                  SizedBox(width: 90),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(hasilKonseling());
                      },
                      child: Icon(
                        Feather.chevron_right,
                        color: AppColors.grey,
                        size: 35,
                      ),
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
