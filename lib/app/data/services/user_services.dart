import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/data/model/user.dart';

class UserServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static UserServices instance = UserServices._();

  UserServices._();
  Future<bool> createUser(UserData userData) async {
    try {
      await _firebaseFirestore
          .collection(CollectionPath.userData)
          .doc(userData.uid)
          .set(userData.toMap());
      return true;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return false;
    }
  }

  Future<UserData?> getUser(String uid) async {
    try {
      var res = await _firebaseFirestore
          .collection(CollectionPath.userData)
          .doc(uid)
          .get();
      if (res.exists) {
        return UserData.fromMap(res.data()!);
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return null;
    }
  }
}

class CollectionPath {
  static const userData = 'user';
}
