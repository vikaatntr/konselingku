import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/user.dart';

class UserServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static UserServices? _userServices;

  static UserServices get instance {
    _userServices ??= UserServices._();
    return _userServices!;
  }

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

  Future<UserData?> getAnotherUser(String email) async {
    try {
      var res = await _firebaseFirestore
          .collection(CollectionPath.userData)
          .where('email', isEqualTo: email)
          .get();
      if (res.size > 0) {
        return UserData.fromMap(res.docs.first.data());
      } else {
        return null;
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return null;
    }
  }

  Future<List<UserData>> getListUser() async {
    try {
      var res =
          await _firebaseFirestore.collection(CollectionPath.userData).get();
      if (res.size > 0) {
        return res.docs.map((e) => UserData.fromMap(e.data())).toList();
      } else {
        return [];
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      return [];
    }
  }

  Future<void> saveFCMToken(String token, String uid) async {
    await FirebaseFirestore.instance
        .collection(CollectionPath.userData)
        .doc(uid)
        .update({
      'fcmToken': token,
    });
  }

  Future<void> updateUser(String uid, UserData user) async {
    await FirebaseFirestore.instance
        .collection(CollectionPath.userData)
        .doc(uid)
        .update(user.toMap());
  }

  Future<void> acceptAccount(String uid) async {
    await FirebaseFirestore.instance
        .collection(CollectionPath.userData)
        .doc(uid)
        .update({
      'isAccept': true,
    });
  }

  Future<void> blockAccount(String uid) async {
    await FirebaseFirestore.instance
        .collection(CollectionPath.userData)
        .doc(uid)
        .delete();
  }
}
