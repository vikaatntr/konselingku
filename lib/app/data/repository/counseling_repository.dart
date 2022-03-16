import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class CounselingRepository {
  static final CounselingRepository _artikelRepository =
      CounselingRepository._();
  static CounselingRepository get instance => _artikelRepository;
  CounselingRepository._();

  Future<void> addCounseling({required Counseling counseling}) async {
    await addCounseling(counseling: counseling);
    await NotificationRepository.instance.sendNotif(
        to: (await UserRepository.instance
            .getAnotherUser(counseling.emailGuru))!,
        title: counseling.bidang,
        message: counseling.description,
        from: counseling.emailSiswa,
        category: "Counseling");
  }
}
