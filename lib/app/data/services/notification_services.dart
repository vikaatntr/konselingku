import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/notification.dart';
import 'package:konselingku/app/data/model/user.dart';

class NotificationServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseMessaging fcm = FirebaseMessaging.instance;

  static NotificationServices? _notificationServices;

  static NotificationServices get instance {
    _notificationServices ??= NotificationServices._();
    return _notificationServices!;
  }

  NotificationServices._();

  Future<void> saveNotification(
      {required UserData to,
      required category,
      required String user,
      required String message,
      required String title,
      data = const {}}) async {
    var notif = AppNotification(
        category: category,
        dateCreated: Timestamp.fromDate(DateTime.now()),
        from: user,
        message: message,
        title: title,
        to: to.email,
        data: data);
    if (to.notification.isEmpty) {
      await _firebaseFirestore
          .collection(CollectionPath.userData)
          .doc(to.uid)
          .set({
        'notification': [notif.toMap()],
      }, SetOptions(merge: true));
    } else {
      await _firebaseFirestore
          .collection(CollectionPath.userData)
          .doc(to.uid)
          .update({
        'notification': FieldValue.arrayUnion([notif.toMap()])
      });
    }
  }

  Future<void> readNotif(UserData user) async {
    await _firebaseFirestore
        .collection(CollectionPath.userData)
        .doc(user.uid)
        .update({
      'notification': user.notification.map((e) {
        e.isRead = true;
        return e.toMap();
      }).toList(),
    });
  }

  Future<void> sendFCM(
      {required String fcmToken,
      required String title,
      required String body,
      required Map data}) async {
    Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
    await http.post(url,
        body: json.encode({
          "to": fcmToken,
          "data": data,
          "priority": "high",
          "notification": {
            "title": title,
            "body": body,
          }
        }),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader:
              "key=AAAAtnATbD4:APA91bEssNtlZzBQd1bi23Hk0qbS25-k_TZN_4v4xlmfc_jfE1PgoRxqFpXUOlZ21N12OG1j68u1hs6qakXDS-ZeSgy9oSpYb6FvRusmIH0jNdajMAsezonePvlDmS1CzDumM44Ovz2L"
        });
  }
}
