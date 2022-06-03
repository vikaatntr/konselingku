import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/data/model/notification.dart';

class UserData {
  // DataSiswa dataSiswa;
  // DataOrangTua dataOrangTua;
  // DataPribadi dataPribadi;
  // KondisiFisikdanPsikis kondisiFisikdanPsikis;
  // AktivitasKelompok aktivitasKelompok;

  String namaLengkap;
  String namaPanggilan;
  String email;
  String noTelp;
  String uid;
  String photoUrl;
  bool? is_far;
  bool is_update;
  Timestamp? locationUpdate;
  double? latitude;
  double? longitude;
  String role;
  String? nip;
  String? emailAnak;
  Timestamp? tanggalLahir;
  int? jenisKelamin;
  int? agama;
  bool isAccept;
  String? fcmToken;
  String? tempatLahir;
  String? facebook;
  List<AppNotification> notification;
  Map<String, Map<String, int>> poinPelanggaran;
  DataPribadi? dataPribadi;
  DataOrangTua? dataOrangTua;
  KeteranganLingkungan? keteranganLingkungan;
  KondisiFisikdanPsikis? kondisiFisikdanPsikis;
  InformasiMasadepan? informasiMasadepan;
  AktivitasKelompok? aktivitasKelompok;

  UserData(
      {required this.email,
      required this.namaLengkap,
      required this.namaPanggilan,
      required this.noTelp,
      required this.photoUrl,
      required this.role,
      required this.uid,
      required this.isAccept,
      this.nip,
      this.emailAnak,
      this.fcmToken,
      this.notification = const [],
      this.poinPelanggaran = const {},
      this.jenisKelamin,
      this.tanggalLahir,
      this.tempatLahir,
      this.agama,
      this.facebook,
      this.dataPribadi,
      this.dataOrangTua,
      this.keteranganLingkungan,
      this.informasiMasadepan,
      this.aktivitasKelompok,
      this.kondisiFisikdanPsikis,
      this.is_update = false,
      this.is_far,
      this.latitude,
      this.longitude,
      this.locationUpdate});

  factory UserData.fromMap(Map map) {
    return UserData(
        email: map['email'] ?? '',
        namaLengkap: map['namaLengkap'] ?? '',
        namaPanggilan: map['namaPanggilan'] ?? '',
        noTelp: map['noTelp'] ?? '',
        photoUrl: map['photoUrl'] ?? '',
        role: map['role'] ?? '',
        uid: map['uid'] ?? '',
        isAccept: map['isAccept'] ?? false,
        nip: map['nip'],
        emailAnak: map['emailAnak'],
        fcmToken: map['fcmToken'],
        poinPelanggaran: map['poinPelanggaran'] == null
            ? {}
            : _convertPoinPelanggaran(map['poinPelanggaran']),
        notification: map['notification'] == null
            ? []
            : (map['notification'] as List)
                .map((e) => AppNotification.fromMap(e))
                .toList()
                .reversed
                .toList(),
        jenisKelamin: map['jenisKelamin'],
        tanggalLahir: map['tanggalLahir'],
        tempatLahir: map['tempatLahir'],
        agama: map['agama'],
        facebook: map['facebook'],
        dataPribadi: map['dataPribadi'] != null
            ? DataPribadi.fromMap(map['dataPribadi'])
            : null,
        dataOrangTua: map['dataOrangTua'] != null
            ? DataOrangTua.fromMap(map['dataOrangTua'])
            : null,
        keteranganLingkungan: map['keteranganLingkungan'] != null
            ? KeteranganLingkungan.fromMap(map['keteranganLingkungan'])
            : null,
        informasiMasadepan: map['informasiMasadepan'] != null
            ? InformasiMasadepan.fromMap(map['informasiMasadepan'])
            : null,
        kondisiFisikdanPsikis: map['kondisiFisikdanPsikis'] != null
            ? KondisiFisikdanPsikis.fromMap(map['kondisiFisikdanPsikis'])
            : null,
        aktivitasKelompok: map['aktivitasKelompok'] != null
            ? AktivitasKelompok.fromMap(map['aktivitasKelompok'])
            : null,
        is_far: map['is_far'],
        latitude: map['latitude'],
        longitude: map['longitude'],
        locationUpdate: map['locationUpdate']);
  }

  static Map<String, Map<String, int>> _convertPoinPelanggaran(Map value) {
    Map<String, Map<String, int>> temp = {};
    for (var element in value.entries) {
      Map<String, int> tempValue = {};
      for (var item in (element.value as Map).entries) {
        tempValue[item.key] = item.value;
      }
      temp[element.key] = tempValue;
    }
    return temp;
  }

  toMap() {
    return {
      'email': email,
      'namaLengkap': namaLengkap,
      'namaPanggilan': namaPanggilan,
      'noTelp': noTelp,
      'photoUrl': photoUrl,
      'role': role,
      'uid': uid,
      'nip': nip,
      'emailAnak': emailAnak,
      'isAccept': isAccept,
      'fcmToken': fcmToken,
      'notification': notification.map((e) => e.toMap()).toList(),
      'poinPelanggaran': poinPelanggaran,
      'jenisKelamin': jenisKelamin,
      'tanggalLahir': tanggalLahir,
      'tempatLahir': tempatLahir,
      'agama': agama,
      'facebook': facebook,
      'dataPribadi': dataPribadi?.toMap(),
      'dataOrangTua': dataOrangTua?.toMap(),
      'keteranganLingkungan': keteranganLingkungan?.toMap(),
      'informasiMasadepan': informasiMasadepan?.toMap(),
      'kondisiFisikdanPsikis': kondisiFisikdanPsikis?.toMap(),
      'aktivitasKelompok': aktivitasKelompok?.toMap(),
      'is_far': is_far,
      'latitude': latitude,
      'longitude': longitude,
      'locationUpdate': locationUpdate
    };
  }

  UserData copyWith({
    String? namaLengkap,
    String? namaPanggilan,
    String? email,
    String? noTelp,
    String? uid,
    String? photoUrl,
    String? role,
    String? nip,
    String? emailAnak,
    Timestamp? tanggalLahir,
    int? jenisKelamin,
    int? agama,
    bool? isAccept,
    String? fcmToken,
    String? tempatLahir,
    String? facebook,
    List<AppNotification>? notification,
    Map<String, Map<String, int>>? poinPelanggaran,
    DataPribadi? dataPribadi,
    DataOrangTua? dataOrangTua,
    KeteranganLingkungan? keteranganLingkungan,
    InformasiMasadepan? informasiMasadepan,
    KondisiFisikdanPsikis? kondisiFisikdanPsikis,
    AktivitasKelompok? aktivitasKelompok,
  }) {
    return UserData(
        email: email ?? this.email,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        namaPanggilan: namaPanggilan ?? this.namaPanggilan,
        noTelp: noTelp ?? this.noTelp,
        photoUrl: photoUrl ?? this.photoUrl,
        role: role ?? this.role,
        uid: uid ?? this.uid,
        isAccept: isAccept ?? this.isAccept,
        nip: nip ?? this.nip,
        emailAnak: emailAnak ?? this.emailAnak,
        fcmToken: fcmToken ?? this.fcmToken,
        poinPelanggaran: poinPelanggaran ?? this.poinPelanggaran,
        notification: notification ?? this.notification,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        agama: agama ?? this.agama,
        facebook: facebook ?? this.facebook,
        dataPribadi: dataPribadi ?? this.dataPribadi,
        dataOrangTua: dataOrangTua ?? this.dataOrangTua,
        keteranganLingkungan: keteranganLingkungan ?? this.keteranganLingkungan,
        aktivitasKelompok: aktivitasKelompok ?? this.aktivitasKelompok,
        informasiMasadepan: informasiMasadepan ?? this.informasiMasadepan,
        kondisiFisikdanPsikis:
            kondisiFisikdanPsikis ?? this.kondisiFisikdanPsikis);
  }
}

class DataPribadi {
  String alamat;
  String jarakSekolah;
  String asalSekolah;
  String kelas;
  String lulusSekolah;
  String nilaiSKHUN;
  String hobby;
  String pelajaranYangDisenangi;
  String citaCita;
  String nisn;
  String beratBadan;
  String tinggiBadan;

  DataPribadi({
    required this.alamat,
    required this.jarakSekolah,
    required this.asalSekolah,
    required this.kelas,
    required this.lulusSekolah,
    required this.nilaiSKHUN,
    required this.hobby,
    required this.pelajaranYangDisenangi,
    required this.citaCita,
    required this.nisn,
    required this.beratBadan,
    required this.tinggiBadan,
  });

  factory DataPribadi.fromMap(Map map) {
    return DataPribadi(
        alamat: map['alamat'],
        jarakSekolah: map['jarakSekolah'],
        asalSekolah: map['asalSekolah'],
        kelas: map['kelas'],
        lulusSekolah: map['lulusSekolah'],
        nilaiSKHUN: map['nilaiSKHUN'],
        hobby: map['hobby'],
        pelajaranYangDisenangi: map['pelajaranYangDisenangi'],
        citaCita: map['citaCita'],
        nisn: map['nisn'],
        beratBadan: map['beratBadan'],
        tinggiBadan: map['tinggiBadan']);
  }

  toMap() => {
        'alamat': alamat,
        'jarakSekolah': jarakSekolah,
        'asalSekolah': asalSekolah,
        'kelas': kelas,
        'lulusSekolah': lulusSekolah,
        'nilaiSKHUN': nilaiSKHUN,
        'hobby': hobby,
        'pelajaranYangDisenangi': pelajaranYangDisenangi,
        'citaCita': citaCita,
        'nisn': nisn,
        'beratBadan': beratBadan,
        'tinggiBadan': tinggiBadan,
      };
}

class DataOrangTua {
  DataAyah dataAyah;
  DataIbu dataIbu;
  DataWali dataWali;

  DataOrangTua(
      {required this.dataAyah, required this.dataIbu, required this.dataWali});

  factory DataOrangTua.fromMap(Map map) {
    return DataOrangTua(
        dataAyah: DataAyah.fromMap(map['dataAyah']),
        dataIbu: DataIbu.fromMap(map['dataIbu']),
        dataWali: DataWali.fromMap(map['dataWali']));
  }

  toMap() => {
        'dataAyah': dataAyah.toMap(),
        'dataIbu': dataIbu.toMap(),
        'dataWali': dataWali.toMap(),
      };
}

class DataAyah {
  String nama;
  String alamat;
  int agama;
  int pendidikan;
  String pekerjaan;
  DataAyah({
    required this.nama,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.pekerjaan,
  });
  factory DataAyah.fromMap(Map map) => DataAyah(
      agama: map['agama'],
      alamat: map['alamat'],
      nama: map['nama'],
      pekerjaan: map['pekerjaan'],
      pendidikan: map['pendidikan']);

  toMap() => {
        'agama': agama,
        'alamat': alamat,
        'nama': nama,
        'pekerjaan': pekerjaan,
        'pendidikan': pendidikan,
      };
}

class DataIbu {
  String nama;
  String alamat;
  int agama;
  int pendidikan;
  String pekerjaan;
  DataIbu({
    required this.nama,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.pekerjaan,
  });
  factory DataIbu.fromMap(Map map) => DataIbu(
      agama: map['agama'],
      alamat: map['alamat'],
      nama: map['nama'],
      pekerjaan: map['pekerjaan'],
      pendidikan: map['pendidikan']);

  toMap() => {
        'agama': agama,
        'alamat': alamat,
        'nama': nama,
        'pekerjaan': pekerjaan,
        'pendidikan': pendidikan,
      };
}

class DataWali {
  String nama;
  String alamat;
  int agama;
  int pendidikan;
  String pekerjaan;
  DataWali({
    required this.nama,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.pekerjaan,
  });
  factory DataWali.fromMap(Map map) => DataWali(
      agama: map['agama'],
      alamat: map['alamat'],
      nama: map['nama'],
      pekerjaan: map['pekerjaan'],
      pendidikan: map['pendidikan']);

  toMap() => {
        'agama': agama,
        'alamat': alamat,
        'nama': nama,
        'pekerjaan': pekerjaan,
        'pendidikan': pendidikan,
      };
}

class KeteranganLingkungan {
  int keutuhanOrtu;
  int keadaanOrtu;
  int keadaanEkonomi;
  int rangePenghasilan;
  int hubunganKeluarga;
  String uangSaku;
  String transportSekolah;
  String masalah;

  KeteranganLingkungan({
    required this.keutuhanOrtu,
    required this.keadaanOrtu,
    required this.keadaanEkonomi,
    required this.rangePenghasilan,
    required this.hubunganKeluarga,
    required this.uangSaku,
    required this.transportSekolah,
    required this.masalah,
  });

  factory KeteranganLingkungan.fromMap(Map map) => KeteranganLingkungan(
      keutuhanOrtu: map['keutuhanOrtu'],
      keadaanOrtu: map['keadaanOrtu'],
      keadaanEkonomi: map['keadaanEkonomi'],
      rangePenghasilan: map['rangePenghasilan'],
      hubunganKeluarga: map['hubunganKeluarga'],
      uangSaku: map['uangSaku'],
      transportSekolah: map['transportSekolah'],
      masalah: map['masalah']);

  toMap() => {
        'keutuhanOrtu': keutuhanOrtu,
        'keadaanOrtu': keadaanOrtu,
        'keadaanEkonomi': keadaanEkonomi,
        'rangePenghasilan': rangePenghasilan,
        'hubunganKeluarga': hubunganKeluarga,
        'uangSaku': uangSaku,
        'transportSekolah': transportSekolah,
        'masalah': masalah,
      };
}

class KondisiFisikdanPsikis {
  int tampilanBadan;
  int penyakit;
  int gangguanIndera;
  String gangguanFisik;
  int emosiTingkahLaku;

  KondisiFisikdanPsikis({
    required this.tampilanBadan,
    required this.penyakit,
    required this.gangguanIndera,
    required this.gangguanFisik,
    required this.emosiTingkahLaku,
  });

  factory KondisiFisikdanPsikis.fromMap(Map map) => KondisiFisikdanPsikis(
      tampilanBadan: map['tampilanBadan'],
      penyakit: map['penyakit'],
      gangguanIndera: map['gangguanIndera'],
      gangguanFisik: map['gangguanFisik'],
      emosiTingkahLaku: map['emosiTingkahLaku']);

  toMap() => {
        'tampilanBadan': tampilanBadan,
        'penyakit': penyakit,
        'gangguanIndera': gangguanIndera,
        'gangguanFisik': gangguanFisik,
        'emosiTingkahLaku': emosiTingkahLaku,
      };
}

class AktivitasKelompok {
  int kedudukan;
  int keterlibatan;
  int kedisiplinan;
  int kerjasama;

  AktivitasKelompok({
    required this.kedudukan,
    required this.keterlibatan,
    required this.kedisiplinan,
    required this.kerjasama,
  });

  factory AktivitasKelompok.fromMap(Map map) => AktivitasKelompok(
      kedudukan: map['kedudukan'],
      keterlibatan: map['keterlibatan'],
      kedisiplinan: map['kedisiplinan'],
      kerjasama: map['kerjasama']);

  toMap() => {
        'kedudukan': kedudukan,
        'keterlibatan': keterlibatan,
        'kedisiplinan': kedisiplinan,
        'kerjasama': kerjasama,
      };
}

class InformasiMasadepan {
  String pilihanSekolah;
  String rencanaPendidikan;
  String citaCita;
  int keterkaitan;
  int dukunganOrtu;
  int kemampuan;

  InformasiMasadepan({
    required this.pilihanSekolah,
    required this.rencanaPendidikan,
    required this.citaCita,
    required this.keterkaitan,
    required this.dukunganOrtu,
    required this.kemampuan,
  });

  factory InformasiMasadepan.fromMap(Map map) => InformasiMasadepan(
      pilihanSekolah: map['pilihanSekolah'],
      rencanaPendidikan: map['rencanaPendidikan'],
      citaCita: map['citaCita'],
      keterkaitan: map['keterkaitan'],
      dukunganOrtu: map['dukunganOrtu'],
      kemampuan: map['kemampuan']);

  toMap() => {
        'pilihanSekolah': pilihanSekolah,
        'rencanaPendidikan': rencanaPendidikan,
        'citaCita': citaCita,
        'keterkaitan': keterkaitan,
        'dukunganOrtu': dukunganOrtu,
        'kemampuan': kemampuan,
      };
}
