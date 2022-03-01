import 'package:cloud_firestore/cloud_firestore.dart';

class Artikel {
  String judul;
  String deskripsi;
  String image;
  Timestamp dateCreated;
  int userLike;
  int userShow;
  String? key;

  Artikel(
      {required this.dateCreated,
      required this.deskripsi,
      required this.image,
      required this.judul,
      required this.userLike,
      required this.userShow,
      this.key});

  factory Artikel.fromMap(Map map) {
    return Artikel(
        dateCreated: map['dateCreated'],
        deskripsi: map['deskripsi'],
        image: map['image'],
        judul: map['judul'],
        userLike: map['userLike'],
        userShow: map['userShow']);
  }

  toMap() => {
        'dateCreated': dateCreated,
        'deskripsi': deskripsi,
        'image': image,
        'judul': judul,
        'userLike': userLike,
        'userShow': userShow,
      };
}
