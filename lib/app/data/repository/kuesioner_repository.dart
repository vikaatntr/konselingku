import 'dart:developer';

import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/model/kuesioner.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/data/services/counseling_services.dart';
import 'package:konselingku/app/data/services/kuesioner_services.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';

class KuesionerRepository {
  static final KuesionerRepository _kuesionerRepository =
      KuesionerRepository._();
  static KuesionerRepository get instance => _kuesionerRepository;
  KuesionerRepository._();

  Kuesioner? kuesioner;

  Future<Kuesioner?> getKuesioner() async {
    if (kuesioner != null) {
      return kuesioner!;
    } else {
      kuesioner = await KuesionerServices.instance
          .getKuesioner(email: Get.find<AppController>().userData!.email);
      return kuesioner;
    }
  }

  Future<void> submitKuesioner(Kuesioner kuesioner) async {
    this.kuesioner = kuesioner;
    await KuesionerServices.instance.submitKuesioner(kuesioner: kuesioner);
  }

  Future<List<Kuesioner>> getAllKuesioner() =>
      KuesionerServices.instance.getAllKuesioner();
}
