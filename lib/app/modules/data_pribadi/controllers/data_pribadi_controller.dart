import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class DataPribadiController extends GetxController {
  Map<String, TextEditingController> infoDataSiswaTextController = {};
  Map<String, TextEditingController> infoPribadiSiswaTextController = {};

  final Rx<Timestamp> _tanggalLahir = Rx<Timestamp>(Timestamp.now());
  set tanggalLahir(Timestamp tanggalLahir) {
    _tanggalLahir.value = tanggalLahir;
    if (infoDataSiswaTextController['tanggalLahir'] != null) {
      infoDataSiswaTextController['tanggalLahir']!.text =
          tanggalLahir.toDate().toString().split(' ')[0];
    }
  }

  Timestamp get tanggalLahir => _tanggalLahir.value;

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
  void onInit() {
    initInfoDataSiswa();
    initInformasiDataPribadiSiswa();
    super.onInit();
  }

  initInfoDataSiswa() {
    infoDataSiswaTextController['namaLengkap'] =
        TextEditingController(text: UserRepository.instance.user!.namaLengkap);
    infoDataSiswaTextController['namaPanggilan'] = TextEditingController(
        text: UserRepository.instance.user!.namaPanggilan);
    infoDataSiswaTextController['email'] =
        TextEditingController(text: UserRepository.instance.user!.email);
    infoDataSiswaTextController['noTelp'] =
        TextEditingController(text: UserRepository.instance.user!.noTelp);
    jenisKelamin = UserRepository.instance.user!.jenisKelamin ?? 0;
    tanggalLahir =
        UserRepository.instance.user!.tanggalLahir ?? Timestamp.now();
    infoDataSiswaTextController['tempatLahir'] =
        TextEditingController(text: UserRepository.instance.user!.tempatLahir);
    infoDataSiswaTextController['tanggalLahir'] = TextEditingController(
        text: UserRepository.instance.user!.tanggalLahir
                ?.toDate()
                .toString()
                .split(' ')[0] ??
            Timestamp.now().toDate().toString().split(' ')[0]);
    agamaSiswa = UserRepository.instance.user!.agama ?? 0;
    infoDataSiswaTextController['facebook'] = TextEditingController(
      text: UserRepository.instance.user!.facebook,
    );
  }

  initInformasiDataPribadiSiswa() {
    infoPribadiSiswaTextController['alamat'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.alamat);
    infoPribadiSiswaTextController['jarakSekolah'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.jarakSekolah);
    infoPribadiSiswaTextController['asalSekolah'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.asalSekolah);
    infoPribadiSiswaTextController['kelas'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.kelas);
    infoPribadiSiswaTextController['lulusSekolah'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.lulusSekolah);
    infoPribadiSiswaTextController['nilaiSKHUN'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.nilaiSKHUN);
    infoPribadiSiswaTextController['hobby'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.hobby);
    infoPribadiSiswaTextController['pelajaranYangDisenangi'] =
        TextEditingController(
            text: UserRepository
                .instance.user!.dataPribadi?.pelajaranYangDisenangi);
    infoPribadiSiswaTextController['citaCita'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.citaCita);
    infoPribadiSiswaTextController['nisn'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.nisn);
    infoPribadiSiswaTextController['beratBadan'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.beratBadan);
    infoPribadiSiswaTextController['tinggiBadan'] = TextEditingController(
        text: UserRepository.instance.user!.dataPribadi?.tinggiBadan);
  }

  saveInfoDataSiswa() {
    UserRepository.instance.user = UserRepository.instance.user!.copyWith(
        email: infoDataSiswaTextController['email']!.text,
        namaLengkap: infoDataSiswaTextController['namaLengkap']!.text,
        namaPanggilan: infoDataSiswaTextController['namaPanggilan']!.text,
        noTelp: infoDataSiswaTextController['noTelp']!.text,
        tempatLahir: infoDataSiswaTextController['tempatLahir']!.text,
        facebook: infoDataSiswaTextController['facebook']!.text,
        tanggalLahir: tanggalLahir,
        jenisKelamin: jenisKelamin,
        agama: agamaSiswa);
    UserRepository.instance
        .updateUser(UserRepository.instance.user!)
        .then((value) => Get.back());
  }

  saveInfoDataPribadi() {
    UserRepository.instance.user = UserRepository.instance.user!.copyWith(
        dataPribadi: DataPribadi(
            alamat: infoPribadiSiswaTextController['alamat']!.text,
            jarakSekolah: infoPribadiSiswaTextController['jarakSekolah']!.text,
            asalSekolah: infoPribadiSiswaTextController['asalSekolah']!.text,
            kelas: infoPribadiSiswaTextController['kelas']!.text,
            lulusSekolah: infoPribadiSiswaTextController['lulusSekolah']!.text,
            nilaiSKHUN: infoPribadiSiswaTextController['nilaiSKHUN']!.text,
            hobby: infoPribadiSiswaTextController['hobby']!.text,
            pelajaranYangDisenangi:
                infoPribadiSiswaTextController['pelajaranYangDisenangi']!.text,
            citaCita: infoPribadiSiswaTextController['citaCita']!.text,
            nisn: infoPribadiSiswaTextController['nisn']!.text,
            beratBadan: infoPribadiSiswaTextController['beratBadan']!.text,
            tinggiBadan: infoPribadiSiswaTextController['tinggiBadan']!.text));

    UserRepository.instance
        .updateUser(UserRepository.instance.user!)
        .then((value) => Get.back());
  }

  @override
  void onClose() {
    infoDataSiswaTextController.forEach((key, value) {
      value.dispose();
    });
    infoPribadiSiswaTextController.forEach((key, value) {
      value.dispose();
    });
  }
}
