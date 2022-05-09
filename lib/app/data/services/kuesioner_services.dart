import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konselingku/app/constant/collection_path.dart';
import 'package:konselingku/app/data/model/kuesioner.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';

class KuesionerServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  static KuesionerServices? _kuesionerServices;

  static KuesionerServices get instance {
    _kuesionerServices ??= KuesionerServices._();
    return _kuesionerServices!;
  }

  KuesionerServices._();

  Future<void> submitKuesioner({required Kuesioner kuesioner}) async {
    await _firebaseFirestore
        .collection(CollectionPath.kuesioner)
        .doc(UserRepository.instance.user!.email)
        .set(kuesioner.toMap());
  }

  Future<Kuesioner?> getKuesioner({required String email}) async {
    var result = await _firebaseFirestore
        .collection(CollectionPath.kuesioner)
        .doc(email)
        .get();
    if (result.exists) {
      return Kuesioner.fromMap(result.data()!);
    } else {
      return null;
    }
  }

  Future<List<Kuesioner>> getAllKuesioner() async {
    var result =
        await _firebaseFirestore.collection(CollectionPath.kuesioner).get();
    if (result.size > 0) {
      return result.docs.map((e) => Kuesioner.fromMap(e.data())).toList();
    } else {
      return [];
    }
  }
}
