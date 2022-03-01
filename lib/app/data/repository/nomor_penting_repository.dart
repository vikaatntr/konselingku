import 'package:konselingku/app/data/model/nomor_penting.dart';
import 'package:konselingku/app/data/services/nomor_penting_services.dart';

class NomorPentingRepository {
  static final NomorPentingRepository _nomorPentingRepository =
      NomorPentingRepository._();
  static NomorPentingRepository get instance => _nomorPentingRepository;
  NomorPentingRepository._();

  List<NomorPenting>? listNomorPenting;

  Future<List<NomorPenting>> getNomorPenting() async {
    listNomorPenting ??= await NomorPentingServices.instance.getNomorPenting();
    if (listNomorPenting != null) {
      return listNomorPenting!;
    } else {
      return [];
    }
  }
}
