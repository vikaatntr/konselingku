import 'package:cloud_firestore/cloud_firestore.dart';

class AppNotification {
  String to;
  String from;
  String message;
  Map data;
  String title;
  String category;
  Timestamp dateCreated;
  bool isRead;

  AppNotification(
      {required this.category,
      required this.dateCreated,
      required this.from,
      required this.message,
      required this.title,
      required this.to,
      required this.data,
      this.isRead = false});

  factory AppNotification.fromMap(map) {
    return AppNotification(
        category: map['category'],
        dateCreated: map['dateCreated'],
        from: map['from'],
        message: map['message'],
        title: map['title'],
        to: map['to'],
        isRead: map['isRead'],
        data: map['data']);
  }

  toMap() => {
        'category': category,
        'dateCreated': dateCreated,
        'from': from,
        'message': message,
        'title': title,
        'to': to,
        'data': data,
        'isRead': isRead
      };
}
