import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/counseling.dart';

class CounselingServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static CounselingServices? _counselingServices;

  static CounselingServices get instance {
    _counselingServices ??= CounselingServices._();
    return _counselingServices!;
  }

  CounselingServices._();

  Future<void> addCounseling({required Counseling counseling}) async {
    await _firebaseFirestore
        .collection(CollectionPath.counseling)
        .add(counseling.toMap());
  }

  Future<List<Counseling>> getCounseling() async {
    try {
      var result =
          await _firebaseFirestore.collection(CollectionPath.counseling).get();
      return result.docs.map((e) => Counseling.fromMap(e.data())).toList();
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return [];
    }
  }
}
