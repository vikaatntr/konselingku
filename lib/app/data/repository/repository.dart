import 'package:konselingku/app/data/repository/artikel_repository.dart';
import 'package:konselingku/app/data/repository/counseling_repository.dart';
import 'package:konselingku/app/data/repository/kuesioner_repository.dart';
import 'package:konselingku/app/data/repository/nomor_penting_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class Repository {
  static dispose() {
    ArtikelRepository.instance.dispose();
    CounselingRepository.instance.dispose();
    KuesionerRepository.instance.dispose();
    NomorPentingRepository.instance.dispose();
    UserRepository.instance.dispose();
  }
}
