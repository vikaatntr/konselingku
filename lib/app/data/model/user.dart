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
      this.dataPribadi});

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
            : null);
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
      'dataPribadi': dataPribadi?.toMap()
    };
  }

  UserData copyWith(
      {String? namaLengkap,
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
      DataPribadi? dataPribadi}) {
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
        dataPribadi: dataPribadi ?? this.dataPribadi);
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

// class DataOrangTua {}

// class DataAyah {}

// class DataIbu {}

// class DataWali {}

// class KeteranganLingkungan {}

// class KondisiFisikdanPsikis {}

// class AktivitasKelompok {}
