class Counseling {
  String emailSiswa;
  String emailGuru;
  String bidang;
  String date;
  String jam;
  String description;
  String status;

  Counseling(
      {required this.bidang,
      required this.date,
      required this.description,
      required this.jam,
      required this.emailGuru,
      required this.emailSiswa,
      this.status = "Menunggu"});

  factory Counseling.fromMap(Map map) {
    return Counseling(
        bidang: map['bidang'],
        date: map['date'],
        description: map['description'],
        jam: map['jam'],
        emailGuru: map['emailGuru'],
        emailSiswa: map['emailSiswa'],
        status: map['status']);
  }

  toMap() => {
        'bidang': bidang,
        'date': date,
        'description': description,
        'jam': jam,
        'emailGuru': emailGuru,
        'emailSiswa': emailSiswa,
        'status': status
      };
}
