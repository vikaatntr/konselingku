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

  UserData({
    required this.email,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.noTelp,
    required this.photoUrl,
    required this.role,
    required this.uid,
  });

  factory UserData.fromMap(Map map) {
    return UserData(
      email: map['email'] ?? '',
      namaLengkap: map['namaLengkap'] ?? '',
      namaPanggilan: map['namaPanggilan'] ?? '',
      noTelp: map['noTelp'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      role: map['role'] ?? '',
      uid: map['uid'] ?? '',
    );
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
