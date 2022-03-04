import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/constant/enum.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class RegisterController extends GetxController {
  final AppController _appController = Get.find();

  /// Password toogle Variable
  /// variable [_showPassword1] merupakan type standart dan variable [_showPassword2] merupakan type confirm
  final _showPassword1 = false.obs;
  final _showPassword2 = false.obs;

  final _role = 0.obs;
  set role(int val) => _role.value = val;
  int get role => _role.value;

  /// membuat controller dari class [TextEditingController]
  /// dan value enum dari [RegisterFormType] untuk register

  Map<RegisterFormType, TextEditingController> textController = {};

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initialTextController();
    super.onInit();
  }

  @override
  void onClose() {
    textController.forEach((key, value) {
      value.dispose();
    });
  }

  /// Method untuk menginialisasi [TextEditingController]
  /// dari values [RegisterFormType]
  void initialTextController() {
    for (var element in RegisterFormType.values) {
      textController[element] = TextEditingController();
    }
  }

  /// Untuk merubah nilai reaktif variable [_showPassword1]
  /// atau [_showPassword2] dengan menggunakan type
  /// variable [_showPassword1] merupakan type standart dan
  /// variable [_showPassword2] merupakan type confirm
  void tooglePassword(PassowrdType type) {
    switch (type) {
      case PassowrdType.standard:
        _showPassword1.value = !_showPassword1.value;
        break;
      case PassowrdType.confirm:
        _showPassword2.value = !_showPassword2.value;
        break;
    }
  }

  /// Password toogle Getter
  /// variable [_showPassword1] merupakan type standart dan
  ///  variable [_showPassword2] merupakan type confirm
  bool showPassword(PassowrdType type) {
    switch (type) {
      case PassowrdType.standard:
        return _showPassword1.value;
      case PassowrdType.confirm:
        return _showPassword2.value;
      default:
        return false;
    }
  }

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      try {
        CustomDialog.loadingDialog();
        if (role == 1) {
          var anak = await UserRepository.instance
              .getAnotherUser(textController[RegisterFormType.emailAnak]!.text);
          if (anak == null) {
            Get.back();
            Get.snackbar("Oops!", "Tidak ada siswa dengan email tersebut",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white);
            return;
          }
        }
        var result = await _appController.auth.createUserWithEmailAndPassword(
            email: textController[RegisterFormType.email]!.text,
            password: textController[RegisterFormType.password]!.text);
        if (result.user != null) {
          var createUser = await UserRepository.instance.createUser(UserData(
              email: textController[RegisterFormType.email]!.text,
              namaLengkap: textController[RegisterFormType.namaLengkap]!.text,
              namaPanggilan:
                  textController[RegisterFormType.namaPanggilan]!.text,
              noTelp: textController[RegisterFormType.noTelepon]!.text,
              photoUrl: '',
              role: role.toString(),
              nip: textController[RegisterFormType.nip]!.text,
              emailAnak: textController[RegisterFormType.emailAnak]!.text,
              uid: result.user!.uid,
              isAccept: role == 0 ? true : false));
          if (createUser) {
            Get.back();
            Get.offNamed(Routes.VERIFIKASI);
          } else {
            await _appController.user!.delete();
            Get.back();
            Get.snackbar("Opps!", "Terjadi Error");
          }
        } else {
          Get.back();
          Get.snackbar("Opps!", "Terjadi Error");
        }
      } on FirebaseAuthException catch (error) {
        Get.back();
        Get.snackbar("Opps!", error.code);
      } catch (e, stackTrace) {
        Get.back();
        Get.snackbar("Opps!", "Terjadi Error");
        log(e.toString(), stackTrace: stackTrace);
      }
    }
  }
}
