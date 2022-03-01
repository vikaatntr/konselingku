class NomorPenting {
  String nama;
  String nomor;
  String link;

  NomorPenting({required this.link, required this.nama, required this.nomor});

  factory NomorPenting.fromMap(Map map) {
    return NomorPenting(
        link: map['link'] ?? '',
        nama: map['nama'] ?? '',
        nomor: map['nomor'] ?? '');
  }
}
