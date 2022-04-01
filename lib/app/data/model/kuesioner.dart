import 'package:konselingku/app/data/model/user.dart';

class Kuesioner {
  List<Map<String, int>> pertanyaan1;
  List<Map<String, int>> pertanyaan2;
  List<Map<String, int>> pertanyaan3;
  List<Map<String, int>> pertanyaan4;
  String email;
  UserData? user;

  Kuesioner(
      {required this.pertanyaan1,
      required this.pertanyaan2,
      required this.pertanyaan3,
      required this.pertanyaan4,
      required this.email});

  factory Kuesioner.fromMap(Map<String, dynamic> map) {
    List<Map<String, int>> p1 = [];
    for (Map e in (map['pertanyaan1'] as List)) {
      Map<String, int> value = {};
      value[e.keys.first] = e[e.keys.first];
      p1.add(value);
    }
    List<Map<String, int>> p2 = [];
    for (Map e in (map['pertanyaan2'] as List)) {
      Map<String, int> value = {};
      value[e.keys.first] = e[e.keys.first];
      p2.add(value);
    }
    List<Map<String, int>> p3 = [];
    for (Map e in (map['pertanyaan3'] as List)) {
      Map<String, int> value = {};
      value[e.keys.first] = e[e.keys.first];
      p3.add(value);
    }
    List<Map<String, int>> p4 = [];
    for (Map e in (map['pertanyaan4'] as List)) {
      Map<String, int> value = {};
      value[e.keys.first] = e[e.keys.first];
      p4.add(value);
    }
    return Kuesioner(
        pertanyaan1: p1,
        pertanyaan2: p2,
        pertanyaan3: p3,
        pertanyaan4: p4,
        email: map['email']);
  }

  toMap() => {
        'pertanyaan1': pertanyaan1,
        'pertanyaan2': pertanyaan2,
        'pertanyaan3': pertanyaan3,
        'pertanyaan4': pertanyaan4,
        'email': email
      };
}
