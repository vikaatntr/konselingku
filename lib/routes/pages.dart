import 'package:konselingku/views/admin/home_page_admin.dart';
import 'package:konselingku/views/counseling_appointment/counseling_appointment.dart';
import 'package:konselingku/views/data_pribadi/home_data_pribadi.dart';
import 'package:konselingku/views/data_pribadi/informasi_data_orang_tua.dart';
import 'package:konselingku/views/data_pribadi/informasi_data_pribadi.dart';
import 'package:konselingku/views/data_pribadi/informasi_data_siswa.dart';
import 'package:konselingku/views/data_pribadi/keterangan_lingkungan%20keluarga.dart';
import 'package:konselingku/views/data_pribadi/menu_data_pribadi.dart';
import 'package:konselingku/views/home/home_page.dart';
import 'package:konselingku/views/kuesioner/informasi_kuesioner_siswa.dart';
import 'package:konselingku/views/kuesioner/kuesioner.dart';
import 'package:konselingku/views/login/forgot_password_page.dart';
import 'package:konselingku/views/login/login_page.dart';
import 'package:konselingku/views/notification/notification_page.dart';
import 'package:konselingku/views/register/register_page.dart';
import 'package:konselingku/views/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

part 'routes.dart';

class AppPages {
  static const SPLASH = _Paths.SPLASH;
  static const NAVIGATOR = _Paths.NAVIGATOR;
  static const MAIN = _Paths.LOGIN;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const REGISTER = _Paths.REGISTER;
  static const HOMEPAGE = _Paths.HOMEPAGE;
  static const HOMEPAGE_ADMIN = _Paths.HOMEPAGE_ADMIN;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const COUNSELING_APPOINTMENT = _Paths.COUNSELING_APPOINTMENT;
  static const INFORMATION_KUESIONER = _Paths.INFORMATION_KUESIONER;
  static const KUESIONER = _Paths.KUESIONER;
  static const HOMEPAGE_DATA_PRIBADI = _Paths.HOMEPAGE_DATA_PRIBADI;
  static const MENU_DATA_PRIBADI = _Paths.MENU_DATA_PRIBADI;
  static const INFO_DATA_SISWA = _Paths.INFO_DATA_SISWA;
  static const INFO_DATA_PRIBADI = _Paths.INFO_DATA_PRIBADI;
  static const INFO_DATA_ORTU = _Paths.INFO_DATA_ORTU;
  static const KET_LINGKUNGAN_KEL = _Paths.KET_LINGKUNGAN_KEL;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const NAVIGATOR = '/';
  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = '/forgot_password';
  static const REGISTER = '/register';
  static const HOMEPAGE = '/homepage';
  static const HOMEPAGE_ADMIN = '/homepage_admin';
  static const NOTIFICATION = '/notification';
  static const COUNSELING_APPOINTMENT = '/counseling_appointment';
  static const INFORMATION_KUESIONER = '/information_kuesioner';
  static const KUESIONER = '/kuesioner';
  static const HOMEPAGE_DATA_PRIBADI = '/homepage_data_pribadi';
  static const MENU_DATA_PRIBADI = '/menu_data_pribadi';
  static const INFO_DATA_SISWA = '/info_data_siswa';
  static const INFO_DATA_PRIBADI = '/info_data_pribadi';
  static const INFO_DATA_ORTU = '/info_data_ortu';
  static const KET_LINGKUNGAN_KEL = '/ket_lingkungan_kel';
}
