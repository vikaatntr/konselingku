import 'dart:developer';

import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/data/services/counseling_services.dart';

class CounselingRepository {
  static final CounselingRepository _artikelRepository =
      CounselingRepository._();
  static CounselingRepository get instance => _artikelRepository;
  CounselingRepository._();

  RxList<Counseling> listAllCounseling = RxList();

  Future<void> addCounseling({required Counseling counseling}) async {
    try {
      await CounselingServices.instance.addCounseling(counseling: counseling);
      var guru =
          (await UserRepository.instance.getAnotherUser(counseling.emailGuru))!;
      await NotificationRepository.instance.sendNotif(
          to: guru,
          title: counseling.bidang,
          message: counseling.description,
          from: counseling.emailSiswa,
          category: "Counseling");
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<List<Counseling>> getCounseling() async {
    listAllCounseling.clear();
    listAllCounseling.addAll(await CounselingServices.instance
        .getCounseling(UserRepository.instance.user!));
    return listAllCounseling;
  }
}
