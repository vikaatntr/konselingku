import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class DataPribadiController extends GetxController {
  UserData? userData;
  bool isViewOnly = Get.arguments != null;
  Map<String, TextEditingController> infoDataSiswaTextController = {};
  Map<String, TextEditingController> infoPribadiSiswaTextController = {};
  Map<String, TextEditingController> infoOrangTuaTextController = {};
  Map<String, TextEditingController> infoLingkunganKeluarga = {};
  Map<String, TextEditingController> infoKondisiFisikdanPsikis = {};
  Map<String, TextEditingController> infoRencanaMasaDepan = {};

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

  final _agamaAyah = 0.obs;
  set agamaAyah(int val) => _agamaAyah.value = val;
  int get agamaAyah => _agamaAyah.value;

  final _pendAyah = 0.obs;
  set pendAyah(int val) => _pendAyah.value = val;
  int get pendAyah => _pendAyah.value;

  final _agamaIbu = 0.obs;
  set agamaIbu(int val) => _agamaIbu.value = val;
  int get agamaIbu => _agamaIbu.value;

  final _pendIbu = 0.obs;
  set pendIbu(int val) => _pendIbu.value = val;
  int get pendIbu => _pendIbu.value;

  final _agamaWali = 0.obs;
  set agamaWali(int val) => _agamaWali.value = val;
  int get agamaWali => _agamaWali.value;

  final _pendWali = 0.obs;
  set pendWali(int val) => _pendWali.value = val;
  int get pendWali => _pendWali.value;

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

  final _kedudukanKelompok = 0.obs;
  set kedudukanKelompok(int val) => _kedudukanKelompok.value = val;
  int get kedudukanKelompok => _kedudukanKelompok.value;

  final _keterlibatanKelompokKerja = 0.obs;
  int get keterlibatanKelompokKerja => _keterlibatanKelompokKerja.value;
  set keterlibatanKelompokKerja(int val) =>
      _keterlibatanKelompokKerja.value = val;

  final _kedisiplinan = 0.obs;
  int get kedisiplinan => _kedisiplinan.value;
  set kedisiplinan(int val) => _kedisiplinan.value = val;

  final _kerjasamaKelompok = 0.obs;
  int get kerjasamaKelompok => _kerjasamaKelompok.value;
  set kerjasamaKelompok(int val) => _kerjasamaKelompok.value = val;

  final _keadaanBadan = 0.obs;
  int get keadaanBadan => _keadaanBadan.value;
  set keadaanBadan(int val) => _keadaanBadan.value = val;

  final _penyakit = 0.obs;
  int get penyakit => _penyakit.value;
  set penyakit(int val) => _penyakit.value = val;

  final _gangguanIndera = 0.obs;
  int get gangguanIndera => _gangguanIndera.value;
  set gangguanIndera(int val) => _gangguanIndera.value = val;

  final _tampilanEmosi = 0.obs;
  int get tampilanEmosi => _tampilanEmosi.value;
  set tampilanEmosi(int val) => _tampilanEmosi.value = val;

  final _keterkaitanMinatBakat = 0.obs;
  int get keterkaitanMinatBakat => _keterkaitanMinatBakat.value;
  set keterkaitanMinatBakat(int val) => _keterkaitanMinatBakat.value = val;

  final _dukunganOrtu = 0.obs;
  int get dukunganOrtu => _dukunganOrtu.value;
  set dukunganOrtu(int val) => _dukunganOrtu.value = val;

  final _ekonomiCita = 0.obs;
  int get ekonomiCita => _ekonomiCita.value;
  set ekonomiCita(int val) => _ekonomiCita.value = val;

  final _sosialKeluarga = 0.obs;
  int get sosialKeluarga => _sosialKeluarga.value;
  set sosialKeluarga(int val) => _sosialKeluarga.value = val;

  @override
  void onInit() {
    userData = Get.arguments ?? UserRepository.instance.user;

    initInfoDataSiswa();
    initInformasiDataPribadiSiswa();
    initInfoOrangTuaSiswa();
    initKeteranganKeluarga();
    initKondisiFisikdanPsikis();
    initAktifitasKelompok();
    initInformasiMasaDepan();
    super.onInit();
  }

  initInfoDataSiswa() {
    infoDataSiswaTextController['namaLengkap'] =
        TextEditingController(text: userData!.namaLengkap);
    infoDataSiswaTextController['namaPanggilan'] =
        TextEditingController(text: userData!.namaPanggilan);
    infoDataSiswaTextController['email'] =
        TextEditingController(text: userData!.email);
    infoDataSiswaTextController['noTelp'] =
        TextEditingController(text: userData!.noTelp);
    jenisKelamin = userData!.jenisKelamin ?? 0;
    tanggalLahir = userData!.tanggalLahir ?? Timestamp.now();
    infoDataSiswaTextController['tempatLahir'] =
        TextEditingController(text: userData!.tempatLahir);
    infoDataSiswaTextController['tanggalLahir'] = TextEditingController(
        text: userData!.tanggalLahir?.toDate().toString().split(' ')[0] ??
            Timestamp.now().toDate().toString().split(' ')[0]);
    agamaSiswa = userData!.agama ?? 0;
    infoDataSiswaTextController['facebook'] = TextEditingController(
      text: userData!.facebook,
    );
  }

  initInformasiDataPribadiSiswa() {
    infoPribadiSiswaTextController['alamat'] =
        TextEditingController(text: userData!.dataPribadi?.alamat);
    infoPribadiSiswaTextController['jarakSekolah'] =
        TextEditingController(text: userData!.dataPribadi?.jarakSekolah);
    infoPribadiSiswaTextController['asalSekolah'] =
        TextEditingController(text: userData!.dataPribadi?.asalSekolah);
    infoPribadiSiswaTextController['kelas'] =
        TextEditingController(text: userData!.dataPribadi?.kelas);
    infoPribadiSiswaTextController['lulusSekolah'] =
        TextEditingController(text: userData!.dataPribadi?.lulusSekolah);
    infoPribadiSiswaTextController['nilaiSKHUN'] =
        TextEditingController(text: userData!.dataPribadi?.nilaiSKHUN);
    infoPribadiSiswaTextController['hobby'] =
        TextEditingController(text: userData!.dataPribadi?.hobby);
    infoPribadiSiswaTextController['pelajaranYangDisenangi'] =
        TextEditingController(
            text: UserRepository
                .instance.user!.dataPribadi?.pelajaranYangDisenangi);
    infoPribadiSiswaTextController['citaCita'] =
        TextEditingController(text: userData!.dataPribadi?.citaCita);
    infoPribadiSiswaTextController['nisn'] =
        TextEditingController(text: userData!.dataPribadi?.nisn);
    infoPribadiSiswaTextController['beratBadan'] =
        TextEditingController(text: userData!.dataPribadi?.beratBadan);
    infoPribadiSiswaTextController['tinggiBadan'] =
        TextEditingController(text: userData!.dataPribadi?.tinggiBadan);
  }

  initInfoOrangTuaSiswa() {
    infoOrangTuaTextController['ayah.nama'] =
        TextEditingController(text: userData!.dataOrangTua?.dataAyah.nama);
    infoOrangTuaTextController['ayah.alamat'] =
        TextEditingController(text: userData!.dataOrangTua?.dataAyah.alamat);
    infoOrangTuaTextController['ayah.pekerjaan'] =
        TextEditingController(text: userData!.dataOrangTua?.dataAyah.pekerjaan);
    agamaAyah = userData!.dataOrangTua?.dataAyah.agama ?? 0;
    pendAyah = userData!.dataOrangTua?.dataAyah.pendidikan ?? 0;

    infoOrangTuaTextController['ibu.nama'] =
        TextEditingController(text: userData!.dataOrangTua?.dataIbu.nama);
    infoOrangTuaTextController['ibu.alamat'] =
        TextEditingController(text: userData!.dataOrangTua?.dataIbu.alamat);
    infoOrangTuaTextController['ibu.pekerjaan'] =
        TextEditingController(text: userData!.dataOrangTua?.dataIbu.pekerjaan);
    agamaIbu = userData!.dataOrangTua?.dataIbu.agama ?? 0;
    pendIbu = userData!.dataOrangTua?.dataIbu.pendidikan ?? 0;

    infoOrangTuaTextController['wali.nama'] =
        TextEditingController(text: userData!.dataOrangTua?.dataWali.nama);
    infoOrangTuaTextController['wali.alamat'] =
        TextEditingController(text: userData!.dataOrangTua?.dataWali.alamat);
    infoOrangTuaTextController['wali.pekerjaan'] =
        TextEditingController(text: userData!.dataOrangTua?.dataWali.pekerjaan);
    agamaWali = userData!.dataOrangTua?.dataWali.agama ?? 0;
    pendWali = userData!.dataOrangTua?.dataWali.pendidikan ?? 0;
  }

  initKeteranganKeluarga() {
    UserData user = userData!;
    infoLingkunganKeluarga['uangSaku'] =
        TextEditingController(text: user.keteranganLingkungan?.uangSaku);
    infoLingkunganKeluarga['transportSekolah'] = TextEditingController(
        text: user.keteranganLingkungan?.transportSekolah);
    infoLingkunganKeluarga['masalah'] =
        TextEditingController(text: user.keteranganLingkungan?.masalah);

    keadaanUtuhOrtu = user.keteranganLingkungan?.keutuhanOrtu ?? 0;
    keadaanOrtu = user.keteranganLingkungan?.keadaanOrtu ?? 0;
    keadaanEkonomi = user.keteranganLingkungan?.keadaanEkonomi ?? 0;
    penghasilanOrtu = user.keteranganLingkungan?.rangePenghasilan ?? 0;
    sosialKeluarga = user.keteranganLingkungan?.hubunganKeluarga ?? 0;
  }

  initKondisiFisikdanPsikis() {
    UserData user = userData!;
    keadaanBadan = user.kondisiFisikdanPsikis?.tampilanBadan ?? 0;
    penyakit = user.kondisiFisikdanPsikis?.penyakit ?? 0;
    gangguanIndera = user.kondisiFisikdanPsikis?.gangguanIndera ?? 0;
    tampilanEmosi = user.kondisiFisikdanPsikis?.emosiTingkahLaku ?? 0;
    infoKondisiFisikdanPsikis['gangguanFisik'] =
        TextEditingController(text: user.kondisiFisikdanPsikis?.gangguanFisik);
  }

  initAktifitasKelompok() {
    UserData user = userData!;
    kedudukanKelompok = user.aktivitasKelompok?.kedudukan ?? 0;
    keterlibatanKelompokKerja = user.aktivitasKelompok?.keterlibatan ?? 0;
    kedisiplinan = user.aktivitasKelompok?.kedisiplinan ?? 0;
    kerjasamaKelompok = user.aktivitasKelompok?.kerjasama ?? 0;
  }

  initInformasiMasaDepan() {
    UserData user = userData!;
    infoRencanaMasaDepan['pilihanSekolah'] =
        TextEditingController(text: user.informasiMasadepan?.pilihanSekolah);
    infoRencanaMasaDepan['rencanaPendidikan'] =
        TextEditingController(text: user.informasiMasadepan?.rencanaPendidikan);
    infoRencanaMasaDepan['citaCita'] =
        TextEditingController(text: user.informasiMasadepan?.citaCita);

    keterkaitanMinatBakat = user.informasiMasadepan?.keterkaitan ?? 0;
    dukunganOrtu = user.informasiMasadepan?.dukunganOrtu ?? 0;
    ekonomiCita = user.informasiMasadepan?.kemampuan ?? 0;
  }

  saveInfoDataSiswa() {
    UserRepository.instance.user = userData!.copyWith(
        email: infoDataSiswaTextController['email']!.text,
        namaLengkap: infoDataSiswaTextController['namaLengkap']!.text,
        namaPanggilan: infoDataSiswaTextController['namaPanggilan']!.text,
        noTelp: infoDataSiswaTextController['noTelp']!.text,
        tempatLahir: infoDataSiswaTextController['tempatLahir']!.text,
        facebook: infoDataSiswaTextController['facebook']!.text,
        tanggalLahir: tanggalLahir,
        jenisKelamin: jenisKelamin,
        agama: agamaSiswa);
    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  saveInfoDataPribadi() {
    UserRepository.instance.user = userData!.copyWith(
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

    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  saveKondisiFisikdanPsikis() {
    UserRepository.instance.user = userData!.copyWith(
        kondisiFisikdanPsikis: KondisiFisikdanPsikis(
            tampilanBadan: keadaanBadan,
            penyakit: penyakit,
            gangguanIndera: gangguanIndera,
            gangguanFisik: infoKondisiFisikdanPsikis['gangguanFisik']!.text,
            emosiTingkahLaku: tampilanEmosi));

    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  saveAktifitasKelompok() {
    UserRepository.instance.user = userData!.copyWith(
        aktivitasKelompok: AktivitasKelompok(
            kedudukan: kedudukanKelompok,
            keterlibatan: keterlibatanKelompokKerja,
            kedisiplinan: kedisiplinan,
            kerjasama: kerjasamaKelompok));

    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  saveInformasiMasaDepan() {
    UserRepository.instance.user = userData!.copyWith(
        informasiMasadepan: InformasiMasadepan(
            pilihanSekolah: infoRencanaMasaDepan['pilihanSekolah']!.text,
            rencanaPendidikan: infoRencanaMasaDepan['rencanaPendidikan']!.text,
            citaCita: infoRencanaMasaDepan['citaCita']!.text,
            keterkaitan: keterkaitanMinatBakat,
            dukunganOrtu: dukunganOrtu,
            kemampuan: ekonomiCita));

    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  saveInfoOrangtua() {
    UserRepository.instance.user = userData!.copyWith(
        dataOrangTua: DataOrangTua(
            dataAyah: DataAyah(
                nama: infoOrangTuaTextController['ayah.nama']!.text,
                alamat: infoOrangTuaTextController['ayah.alamat']!.text,
                agama: agamaAyah,
                pendidikan: pendAyah,
                pekerjaan: infoOrangTuaTextController['ayah.pekerjaan']!.text),
            dataIbu: DataIbu(
                nama: infoOrangTuaTextController['ibu.nama']!.text,
                alamat: infoOrangTuaTextController['ibu.alamat']!.text,
                agama: agamaIbu,
                pendidikan: pendIbu,
                pekerjaan: infoOrangTuaTextController['ibu.pekerjaan']!.text),
            dataWali: DataWali(
                nama: infoOrangTuaTextController['wali.nama']!.text,
                alamat: infoOrangTuaTextController['wali.alamat']!.text,
                agama: agamaWali,
                pendidikan: pendWali,
                pekerjaan:
                    infoOrangTuaTextController['wali.pekerjaan']!.text)));

    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  saveKeteranganKeluarga() {
    UserRepository.instance.user = userData!.copyWith(
        keteranganLingkungan: KeteranganLingkungan(
            keutuhanOrtu: keadaanUtuhOrtu,
            keadaanOrtu: keadaanOrtu,
            keadaanEkonomi: keadaanEkonomi,
            rangePenghasilan: penghasilanOrtu,
            hubunganKeluarga: sosialKeluarga,
            uangSaku: infoLingkunganKeluarga['uangSaku']!.text,
            transportSekolah: infoLingkunganKeluarga['transportSekolah']!.text,
            masalah: infoLingkunganKeluarga['masalah']!.text));

    UserRepository.instance.updateUser(userData!).then((value) => Get.back());
  }

  @override
  void onClose() {
    infoDataSiswaTextController.forEach((key, value) {
      value.dispose();
    });
    infoPribadiSiswaTextController.forEach((key, value) {
      value.dispose();
    });
    infoOrangTuaTextController.forEach((key, value) {
      value.dispose();
    });
    infoLingkunganKeluarga.forEach((key, value) {
      value.dispose();
    });
    infoKondisiFisikdanPsikis.forEach((key, value) {
      value.dispose();
    });
    infoRencanaMasaDepan.forEach((key, value) {
      value.dispose();
    });
  }
}
