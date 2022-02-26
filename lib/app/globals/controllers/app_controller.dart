import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? get user => auth.currentUser;
  bool get isLogin => user != null;

  @override
  void onInit() {
    super.onInit();
  }
}
