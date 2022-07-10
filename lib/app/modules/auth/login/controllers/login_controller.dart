import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/globals/controllers/app_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/dialog.dart';

class LoginController extends GetxController {
  final AppController _appController = Get.find();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _showPassword = false.obs;
  get showPassword => _showPassword.value;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      kebijakanPrivasi();
    });
    super.onInit();
  }

  void kebijakanPrivasi() {
    showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: const Text(
                "Kebijakan Privasi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                height: Get.height * 0.7,
                width: double.infinity,
                child: const SingleChildScrollView(child: Text('''
Halaman ini merupakan Kebijakan Privasi yang menjelaskan akses kami dalam menyimpan, mengumpulkan, menggunakan, dan melindungi informasi pribadi pengguna dalam layanan aplikasi Konselingku (Guru, Siswa dan Wali Murid). Kami memahami bahwa privasi itu penting saat membagikan lokasi Anda. Itu sebabnya kami memiliki fitur bawaan yang memberi Anda visibilitas dan kontrol atas apa yang Anda bagikan. Kami telah menyiapkan Kebijakan Privasi ini untuk memastikan Anda mengetahui praktik kami Pengguna dimohon membaca dan memahami Kebijakan Privasi ini untuk memastikan proses pengolahan dan penyimpanan data oleh Konselingku. Kebijakan Privasi ini berlaku efektif mulai tanggal 1 Juli 2022.\n
\n1.	Pengumpulan Data Pengguna\n
Dalam mengakses layanan Konselingku melalui aplikasi Konselingku, kami mengumpulkan data pribadi pengguna untuk dapat mengakses layanan Konselingku. Adapun data-data yang diperlukan untuk akses layanan termasuk namun tidak terbatas pada:\n
•	Data pribadi pengguna: nama, nomor telepon, alamat email, tanggal lahir\n
•	Lokasi pengguna: Konselingku adalah aplikasi yang memiliki fitur berbasis lokasi. Untuk memberikan layanan kepada Anda, kami perlu mengakses, menyimpan data lokasi Anda, dan menampilkan check-in di berbagai tempat. Tak satu pun dari informasi ini akan dijual kepada pihak ketiga. Lokasi digunakan untuk keperluan melacak lokasi siswa supaya selalu berada di area sekolah yang ditentukan. Aplikasi ini menggunakan lokasi Anda di latar belakang saat aplikasi digunakan.\n\n
2.	Tujuan Pengumpulan Data atau Informasi Pengguna\n
Pengumpulan data pribadi pengguna dalam mengakses aplikasi Konselingku pada saat pendaftaran bertujuan untuk kelancaran proses layanan bimbingan konseling dari aplikasi Konselingku itu sendiri. Data yang diberikan oleh pengguna kepada pihak Konselingku akan digunakan sebaik mungkin untuk keberhasilan proses bimbingan konseling dan memenuhi kepuasan pengalaman pengguna dalam menggunakan jasa layanan bimbingan konseling Konselingku.
\n\n3.	Permintaan Izin Perangkat Seluler\n
Aplikasi Konselingku membutuhkan izin sebelum mengakses data pribadi pengguna. Adapun tidak diberikannya izin oleh pengguna akan berpengaruh dalam kegunaan atau fungsi aplikasi Konselingku. Jika pengguna telah memberikan izin, maka aplikasi Konselingku dapat memproses data pengguna dalam batas wajar untuk keperluan penggunaan aplikasi.
\na.	Perizinan Akses Lokasi\n
Aplikasi Konselingku memerlukan data pengguna untuk mengetahui lokasi siswa apabila terdapat melakukan kecurangan dalam kegiatan pembelajaran seperti meninggalkan lokasi sekolah dengan fitur lokasi. Konselingku adalah layanan berbasis lokasi. Agar aplikasi berfungsi penuh, kami memerlukan lokasi Anda yang tepat dan perlu menyimpan riwayat lokasi Anda. Anda memberi kami lokasi Anda melalui pengaturan izin di ponsel Anda. Kami mengumpulkan lokasi Anda menggunakan metode yang mencakup GPS, jaringan nirkabel, menara seluler, titik akses, dan Wi-Fi. Kami menggunakan berbagai sumber data ini untuk memberi guru Anda gambaran paling akurat tentang di mana Anda berada. Jika, karena alasan apa pun, Anda mengizinkan orang lain menggunakan ponsel Anda dan sudah berada di luar jam sekolah, Anda dapat menonaktifkan berbagi lokasi untuk menjaga kerahasiaan lokasi mereka serta mencegah kesalahpahaman tentang lokasi Anda sendiri.
\nb.	Perizinan Akses Email\n
Aplikasi Konselingku akan mengirimkan verifikasi email melalui email yang sudah didaftarkan pada aplikasi Konselingku setiap kali pengguna melakukan registrasi akun baru pada Aplikasi Konselingku.
\n\n4.	Pemberlakuan Kebijakan Privasi\n
Kebijakan Privasi ini dapat sewaktu-waktu ditinjau dan diubah kembali atas kebijakan dan pertimbangan dari pihak Konselingku sendiri menyesuaikan perkembangan Konselingku di masa depan dan/atau perubahan hukum atau peraturan yang berlaku. Perubahan yang dilakukan oleh Konselingku akan dicantumkan dalam situs web angkut dan pengguna diharapkan memahami serta meninjau secara seksama kebijakan privasi yang diberlakukan.
        ''')),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Tutup"))
                  ],
                )
              ],
            ));
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  passwordToggle() {
    _showPassword.value = !_showPassword.value;
  }

  Future<void> login() async {
    CustomDialog.loadingDialog();
    try {
      var result = await _appController.auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      await _appController.getUserData();
      if (_appController.userData != null) {
        if (_appController.userData!.role == '3') {
          Get.offAllNamed(Routes.ADMIN_HOME);
        } else {
          if (result.user!.emailVerified) {
            if (_appController.userData!.isAccept) {
              _appController.getRoutesByRole(_appController.userData!.role);
            } else {
              Get.back();
              Get.snackbar("Oops!", "Pendaftaran belum di setujui Admin",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.red);
            }
          } else {
            Get.back();
            Get.toNamed(Routes.VERIFIKASI);
          }
        }
      } else {
        Get.back();
        Get.snackbar("Oops!",
            "Akun anda telah di blokir admin, Hubungi admin untuk pemulihan");
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar("Oops!", e.code);
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
    }
  }
}
