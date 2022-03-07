import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/artikel.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PROFILE);
            },
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
              onTap: () {
                Get.toNamed(Routes.NOTIFICATION);
              },
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
    return RefreshIndicator(
      onRefresh: () => controller.getData(refresh: true),
      child: SingleChildScrollView(
        // padding: EdgeInsets.only(top: 30),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _boxTitle(),
            const SizedBox(height: 20),
            _title("Layanan"),
            const SizedBox(height: 15),
            _menuApp(),
            const SizedBox(height: 15),
            _title("Artikel"),
            const SizedBox(height: 15),
            _artikel(),
            _title("Nomor Penting"),
            const SizedBox(height: 15),
            _nomorPenting(),
            const SizedBox(height: 40),
          ],
        )),
      ),
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
                  Obx(() {
                    if (controller.user == null) {
                      log("Get User Data");
                      controller.getUserData();
                      return const SizedBox.shrink();
                    } else {
                      return Text(
                        "Halo ${controller.user!.namaPanggilan}",
                        style: GoogleFonts.poppins(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      );
                    }
                  }),
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

  Widget _title(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
                      Get.toNamed(Routes.COUNSELING_APPOINTMENT);
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
                      Get.toNamed(Routes.KUESIONER);
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
                          color: AppColors.brown,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "assets/images/location.png",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "Lokasi",
                      style: GoogleFonts.poppins(fontSize: 13),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _artikel() {
    return AspectRatio(
      aspectRatio: 1 / 1.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Obx(
              () => ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  _filter(
                      title: "Terbaru",
                      enable: controller.filterArtikel == "Terbaru",
                      onTap: () {
                        controller.filterArtikel = "Terbaru";
                        controller.listArtikel.sort(
                            ((a, b) => b.dateCreated.compareTo(a.dateCreated)));
                      }),
                  _filter(
                      title: "Populer",
                      enable: controller.filterArtikel == "Populer",
                      onTap: () {
                        controller.filterArtikel = "Populer";
                        controller.listArtikel
                            .sort(((a, b) => b.userShow.compareTo(a.userShow)));
                      })
                ],
              ),
            ),
          ),
          Expanded(
              flex: 9,
              child: Obx(
                () => controller.listArtikel.isNotEmpty
                    ? PageView.builder(
                        itemCount: controller.listArtikel.length,
                        controller: controller.artikelController,
                        itemBuilder: (context, i) => Container(
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.2,
                                  blurRadius: 15,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: InkWell(
                                onTap: () {
                                  controller
                                      .showArtikel(controller.listArtikel[i]);
                                },
                                child:
                                    _artikelView(controller.listArtikel[i]))))
                    : const Center(child: Text("Tidak ada Artikel")),
              )),
          Expanded(
              flex: 2,
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            controller.listArtikel.length,
                            (index) => Container(
                                  margin: const EdgeInsets.only(right: 2),
                                  padding: EdgeInsets.all(
                                      controller.artikelIndex.value == index
                                          ? 6
                                          : 4),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey),
                                )),
                      )),
                ),
              )),
        ],
      ),
    );
  }

  Widget _artikelView(Artikel artikel) {
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(15))),
              child: Image.network(
                artikel.image,
                fit: BoxFit.cover,
              ),
            )),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artikel.judul,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Text(artikel.dateCreated.toDate().toString().split(" ")[0],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w300))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _filter(
      {required String title,
      required bool enable,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
          decoration: BoxDecoration(
              border: enable
                  ? null
                  : Border.all(
                      color: AppColors.primaryColor,
                    ),
              color: enable ? AppColors.primaryColor : null,
              borderRadius: BorderRadius.circular(24)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: enable ? Colors.white : AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nomorPenting() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => controller.listNomorPenting.isNotEmpty
            ? Column(
                children: controller.listNomorPenting
                    .map((e) => Card(
                          child: ListTile(
                            onTap: () async {
                              if (await canLaunch(e.link)) {
                                launch(e.link);
                              }
                            },
                            title: Text(
                              e.nama,
                              style: Get.textTheme.headline6,
                            ),
                            subtitle: Text(
                              e.nomor,
                              style: Get.textTheme.bodyText1,
                            ),
                          ),
                        ))
                    .toList(),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
