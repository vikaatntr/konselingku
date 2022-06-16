import 'dart:developer';

import 'package:get/get.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/data/services/counseling_services.dart';

class CounselingRepository {
  static final CounselingRepository _artikelRepository =
      CounselingRepository._();
  static CounselingRepository get instance => _artikelRepository;
  CounselingRepository._();

  RxList<Counseling> listAllCounseling = RxList();

  Future<void> addCounseling(
      {required Counseling counseling, bool fromGuru = false}) async {
    try {
      await CounselingServices.instance.addCounseling(counseling: counseling);
      var user = (await UserRepository.instance.getAnotherUser(
          fromGuru ? counseling.emailSiswa : counseling.emailGuru))!;
      await NotificationRepository.instance.sendNotif(
          to: user,
          title: "KONSELING : " + counseling.bidang,
          message: counseling.description,
          from: counseling.emailSiswa,
          category: "Counseling");
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<void> accCounseling({required Counseling counseling}) async {
    try {
      await CounselingServices.instance.accCounseling(keys: counseling.keys);
      var user = (await UserRepository.instance
          .getAnotherUser(counseling.emailSiswa))!;
      await NotificationRepository.instance.sendNotif(
          to: user,
          title: "KONSELING : " + counseling.bidang + "Disetujui",
          message: "[Konseling Disetujui] " + counseling.description,
          from: counseling.emailSiswa,
          category: "Counseling");
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<void> tolakCounseling({
    required Counseling counseling,
  }) async {
    try {
      await CounselingServices.instance.tolakCounseling(keys: counseling.keys);
      var user = (await UserRepository.instance
          .getAnotherUser(counseling.emailSiswa))!;
      await NotificationRepository.instance.sendNotif(
          to: user,
          title: "KONSELING : " + counseling.bidang + "Ditolak",
          message: "[Konseling Ditolak] " + counseling.description,
          from: counseling.emailSiswa,
          category: "Counseling");
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }

  Future<List<Counseling>> getCounseling({UserData? user}) async {
    listAllCounseling.clear();
    listAllCounseling.addAll(await CounselingServices.instance
        .getCounseling(user ?? UserRepository.instance.user!));
    return listAllCounseling;
  }
}
