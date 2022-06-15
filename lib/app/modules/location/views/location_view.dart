import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

import '../../../widget/general/app_bar.dart';
import '../controllers/location_controller.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationView extends GetView<LocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Track Siswa"),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
      child: Form(
          child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pictureBox1(),
            const SizedBox(height: 20),
            _contentBox1(),
            _contentBox2()
          ],
        ),
      )),
    );
  }

  Widget _pictureBox1() {
    return Container(
      alignment: Alignment.center,
      height: 450,
      width: 450,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3)),
            ]),
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(UserRepository.instance.sekolah!['latitude'],
                UserRepository.instance.sekolah!['longitude']),
            zoom: 13.0,
          ),
          layers: [
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(UserRepository.instance.sekolah!['latitude'],
                      UserRepository.instance.sekolah!['longitude']),
                  builder: (ctx) => const Icon(
                    Icons.school,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
          children: <Widget>[
            TileLayerWidget(
                options: TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'])),
            MarkerLayerWidget(
                options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(
                      controller.user.latitude!, controller.user.longitude!),
                  builder: (ctx) => const Icon(Icons.location_on),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _contentBox1() {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Text(
            Get.arguments is UserData
                ? controller.user.namaPanggilan
                : "Halo ${controller.user.namaPanggilan}",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget _contentBox2() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Text(
            Get.arguments is UserData
                ? "Berada diluar sekolah"
                : controller.user.is_far ?? false
                    ? "Kamu berada di luar sekolah di jam pelajaran, kamu akan mendapat hukuman"
                    : "Kamu sudah berada di lokasi yang sudah ditentukan, selamat belajar!",
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
  }
}
