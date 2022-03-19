import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/counseling.dart';
import 'package:konselingku/app/data/model/user.dart';

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

  Future<List<Counseling>> getCounseling(UserData user) async {
    try {
      if (user.role == "0") {
        var result = await _firebaseFirestore
            .collection(CollectionPath.counseling)
            .where('emailSiswa', isEqualTo: user.email)
            .get();
        return result.docs.map((e) => Counseling.fromMap(e.data())).toList();
      } else {
        var result = await _firebaseFirestore
            .collection(CollectionPath.counseling)
            .where('emailGuru', isEqualTo: user.email)
            .get();
        return result.docs.map((e) => Counseling.fromMap(e.data())).toList();
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return [];
    }
  }
}
