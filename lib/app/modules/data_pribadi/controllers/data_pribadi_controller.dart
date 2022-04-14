import 'package:get/get.dart';

class DataPribadiController extends GetxController {
  // ignore: todo
  //TODO: Implement DataPribadiController

  final count = 0.obs;
  final _jk = 0.obs;
  set jenisKelamin(int val) => _jk.value = val;
  int get jenisKelamin => _jk.value;

  final _agamaSiswa = 0.obs;
  set agamaSiswa(int val) => _agamaSiswa.value = val;
  int get agamaSiswa => _agamaSiswa.value;

  final _agamaOrtu = 0.obs;
  set agamaOrtu(int val) => _agamaOrtu.value = val;
  int get agamaOrtu => _agamaOrtu.value;

  final _pendOrtu = 0.obs;
  set pendOrtu(int val) => _pendOrtu.value = val;
  int get pendOrtu => _pendOrtu.value;

  final _keadaanUtuhOrtu = 0.obs;
  set keadaanUtuhOrtu(int val) => _keadaanUtuhOrtu.value = val;
  int get keadaanUtuhOrtu => _keadaanUtuhOrtu.value;

  final _keadaanOrtu = 0.obs;
  set keadaanOrtu(int val) => _keadaanOrtu.value = val;
  int get keadaanOrtu => _keadaanOrtu.value;

  final _keadaanEkonomi = 0.obs;
  set keadaanEkonomi(int val) => _keadaanEkonomi.value = val;
  int get keadaanEkonomi => _keadaanEkonomi.value;

  final _penghasilanOrtu = 0.obs;
  set penghasilanOrtu(int val) => _penghasilanOrtu.value = val;
  int get penghasilanOrtu => _penghasilanOrtu.value;

  @override
  void onClose() {}
  void increment() => count.value++;
}
