import 'dart:developer';

import 'package:get/get.dart';
import 'package:konselingku/app/data/repository/notification_repository.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/views/value_poin.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

import '../../../data/model/user.dart';

class PoinPelanggaranController extends GetxController
    with StateMixin<List<UserData>> {
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    try {
      UserRepository.instance.getListUser().then((val) {
        var value = val.where((element) => element.role == "0").toList();
        if (value.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(value, status: RxStatus.success());
        }
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    super.onInit();
  }

  Future<void> submitPoin(List<int> valueKelakuan, List<int> valueKerajinan,
      List<int> valueKerapian, String emailSiswa) async {
    CustomDialog.loadingDialog();
    int jumlahPoint = 0;
    try {
      UserData siswa =
          (await UserRepository.instance.getAnotherUser(emailSiswa))!;
      Map<String, Map<String, int>> poinSiswa = siswa.poinPelanggaran;
      if (poinSiswa['Kelakuan'] != null) {
        for (var i = 0; i < poinSiswa['Kelakuan']!.length; i++) {
          poinSiswa['Kelakuan']![listKelakuan.keys.toList()[i]] =
              poinSiswa['Kelakuan']![listKelakuan.keys.toList()[i]]! +
                  valueKelakuan[i];
          jumlahPoint +=
              poinSiswa['Kelakuan']![listKelakuan.keys.toList()[i]]! +
                  valueKelakuan[i];
        }
      } else {
        poinSiswa["Kelakuan"] = {
          for (var i = 0; i < listKelakuan.length; i++)
            listKelakuan.entries.toList()[i].key: valueKelakuan[i]
        };
        for (var i = 0; i < valueKelakuan.length; i++) {
          jumlahPoint += valueKelakuan[i];
        }
      }
      if (poinSiswa['Kerajinan'] != null) {
        for (var i = 0; i < poinSiswa['Kerajinan']!.length; i++) {
          poinSiswa['Kerajinan']![listKerajinan.keys.toList()[i]] =
              poinSiswa['Kerajinan']![listKerajinan.keys.toList()[i]]! +
                  valueKerajinan[i];
          jumlahPoint +=
              poinSiswa['Kerajinan']![listKerajinan.keys.toList()[i]]! +
                  valueKerajinan[i];
        }
      } else {
        poinSiswa["Kerajinan"] = {
          for (var i = 0; i < listKerajinan.length; i++)
            listKerajinan.entries.toList()[i].key: valueKerajinan[i]
        };
        for (var i = 0; i < listKerajinan.length; i++) {
          jumlahPoint += valueKerajinan[i];
        }
      }
      if (poinSiswa['Kerapian'] != null) {
        for (var i = 0; i < poinSiswa['Kerapian']!.length; i++) {
          poinSiswa['Kerapian']![listKerapian.keys.toList()[i]] =
              poinSiswa['Kerapian']![listKerapian.keys.toList()[i]]! +
                  valueKerapian[i];
          jumlahPoint +=
              poinSiswa['Kerapian']![listKerapian.keys.toList()[i]]! +
                  valueKerapian[i];
        }
      } else {
        poinSiswa["Kerapian"] = {
          for (var i = 0; i < listKerapian.length; i++)
            listKerapian.entries.toList()[i].key: valueKerapian[i]
        };
        for (var i = 0; i < listKerapian.length; i++) {
          jumlahPoint += valueKerapian[i];
        }
      }
      if (jumlahPoint >= 100) {
        NotificationRepository.instance.sendNotif(
            to: siswa,
            title: "Pelanggaran",
            message: "Poin pelanggaran melebihi batas",
            from: UserRepository.instance.user!.namaPanggilan,
            category: "Pelanggaran");
        NotificationRepository.instance.sendNotif(
            to: UserRepository.instance.user!,
            title: "Pelanggaran",
            message: "Poin ${siswa.namaLengkap} pelanggaran melebihi batas",
            from: UserRepository.instance.user!.namaPanggilan,
            category: "Pelanggaran");
        Get.snackbar("Perlu tindakan!",
            "Poin ${siswa.namaLengkap} sudah melebihi batas");
      }
      siswa.poinPelanggaran = poinSiswa;
      await UserRepository.instance.updateUser(siswa);
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      Get.snackbar("Sukses!", "Berhasil memberikan poin");
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      Get.back();
      Get.back();
      Get.back();
      Get.back();
      Get.snackbar("Oops!", "Gagal memberikan poin");
    }
  }
}
