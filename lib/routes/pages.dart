import 'package:konselingku/views/counseling_appointment/counseling_appointment.dart';
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
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const COUNSELING_APPOINTMENT = _Paths.COUNSELING_APPOINTMENT;
  static const INFORMATION_KUESIONER = _Paths.INFORMATION_KUESIONER;
  static const KUESIONER = _Paths.KUESIONER;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const NAVIGATOR = '/';
  static const LOGIN = '/login';
  static const FORGOT_PASSWORD = '/forgot_password';
  static const REGISTER = '/register';
  static const HOMEPAGE = '/homepage';
  static const NOTIFICATION = '/notification';
  static const COUNSELING_APPOINTMENT = '/counseling_appointment';
  static const INFORMATION_KUESIONER = '/information_kuesioner';
  static const KUESIONER = '/kuesioner';
}
