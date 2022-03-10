import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/artikel.dart';
import 'package:konselingku/app/data/model/nomor_penting.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/artikel_repository.dart';
import 'package:konselingku/app/data/repository/nomor_penting_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

import '../views/detail_artikel_view.dart';

class HomeController extends GetxController {
  final Rx<UserData?> _user = Rx<UserData?>(null);
  UserData? get user => _user.value;

  final RxList<Artikel> listArtikel = RxList<Artikel>();
  final RxList<NomorPenting> listNomorPenting = RxList<NomorPenting>();

  final UserRepository _userRepository = UserRepository.instance;
  final ArtikelRepository _artikelRepository = ArtikelRepository.instance;
  final NomorPentingRepository _nomorPentingRepository =
      NomorPentingRepository.instance;

  final _filterArtikel = "Terbaru".obs;
  String get filterArtikel => _filterArtikel.value;
  set filterArtikel(String val) => _filterArtikel.value = val;

  PageController artikelController = PageController();

  final artikelIndex = 0.obs;

  @override
  onInit() {
    getData();
    artikelController.addListener(() {
      artikelIndex.value = artikelController.page!.toInt();
    });
    super.onInit();
  }

  @override
  void onClose() {
    artikelController.dispose();
    super.onClose();
  }

  Future<void> getData({bool refresh = false}) async {
    await Future.wait([
      getUserData(refresh: refresh),
      getArtikel(refresh: refresh),
      getNomorPenting(refresh: refresh)
    ]);
    filterArtikel = "Terbaru";
  }

  Future<void> getUserData({bool refresh = false}) async {
    if (_userRepository.user == null || refresh) {
      _user.value = await _userRepository.getUser();
    } else {
      _user.value = _userRepository.user;
    }
  }

  Future<void> showArtikel(Artikel artikel) async {
    _artikelRepository.addShowArtikel(artikel.key!);
    Get.to(() => DetailArtikel(artikel: artikel));
  }

  Future<void> getArtikel({bool refresh = false}) async {
    if (_artikelRepository.listArtikel == null || refresh) {
      var res = await _artikelRepository.getArtikel();
      listArtikel.clear();
      listArtikel.addAll(res);
    } else {
      listArtikel.clear();
      listArtikel.addAll(_artikelRepository.listArtikel!);
    }
  }

  Future<void> getNomorPenting({bool refresh = false}) async {
    if (_nomorPentingRepository.listNomorPenting == null || refresh) {
      var res = await _nomorPentingRepository.getNomorPenting();
      listNomorPenting.clear();
      listNomorPenting.addAll(res);
    } else {
      listNomorPenting.clear();
      listNomorPenting.addAll(_nomorPentingRepository.listNomorPenting!);
    }
  }
}