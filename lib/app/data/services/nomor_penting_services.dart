import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/nomor_penting.dart';

class NomorPentingServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final NomorPentingServices _nomorPentingServices =
      NomorPentingServices._();
  static NomorPentingServices get instance => _nomorPentingServices;
  NomorPentingServices._();

  Future<List<NomorPenting>> getNomorPenting() async {
    try {
      var res = await _firebaseFirestore
          .collection(CollectionPath.nomorPenting)
          .get();
      if (res.size > 0) {
        var result =
            res.docs.map((e) => NomorPenting.fromMap(e.data())).toList();
        return result;
      } else {
        return [];
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return [];
    }
  }
}
