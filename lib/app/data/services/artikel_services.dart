import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/artikel.dart';

class ArtikelServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static ArtikelServices? _artikelServices;

  static ArtikelServices get instance {
    _artikelServices ??= ArtikelServices._();
    return _artikelServices!;
  }

  ArtikelServices._();

  Future<List<Artikel>> getListArtikel() async {
    try {
      var res = await _firebaseFirestore
          .collection(CollectionPath.artikel)
          .orderBy('userShow')
          .get();
      if (res.size > 0) {
        return res.docs
            .map((e) => Artikel.fromMap(e.data())..key = e.id)
            .toList();
      } else {
        return [];
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return [];
    }
  }

  Future<void> addShowArtikel(String key) async {
    try {
      await _firebaseFirestore
          .collection(CollectionPath.artikel)
          .doc(key)
          .update({'userShow': FieldValue.increment(1)});
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
