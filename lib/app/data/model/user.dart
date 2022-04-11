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
  bool isAccept;
  String? fcmToken;
  List<AppNotification> notification;
  Map<String, Map<String, int>> poinPelanggaran;

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
      this.poinPelanggaran = const {}});

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
                .toList());
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
      'poinPelanggaran': poinPelanggaran
    };
  }
}

// class DataSiswa {
//   String? namaLengkap;
//   String? namaPanggilan;
//   String? email;
//   String? noTelp;
//   String? uid;
//   String? photoUrl;
//   String? role;
//   String? jenisKelamin;
//   String? tglLahir;
//   String? tempatLahir;
//   String? agama;
//   String? facebook;

//   DataSiswa(
//       {this.agama,
//       this.email,
//       this.facebook,
//       this.jenisKelamin,
//       this.namaLengkap,
//       this.namaPanggilan,
//       this.noTelp,
//       this.photoUrl,
//       this.role,
//       this.tempatLahir,
//       this.tglLahir,
//       this.uid});

//   factory DataSiswa.fromMap() {
//     return DataSiswa();
//   }
// }

// class DataPribadi {
//   String alamat;
//   int jarakKeSekolah;
//   String asalSekolah;
//   String kelas;
//   String lulusSekolah;
//   String nilaiSKHUN;
//   String hobby;
//   String pelajaranYangDisenangi;
//   String citaCita;
//   String NISN;
//   int beratBadan;
//   int tinggiBadan;
// }

// class DataOrangTua {}

// class DataAyah {}

// class DataIbu {}

// class DataWali {}

// class KeteranganLingkungan {}

// class KondisiFisikdanPsikis {}

// class AktivitasKelompok {}
