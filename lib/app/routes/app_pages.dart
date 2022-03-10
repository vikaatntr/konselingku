import 'package:get/get.dart';

import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/appointment/counseling_appointment/bindings/counseling_appointment_binding.dart';
import '../modules/appointment/counseling_appointment/views/counseling_appointment_view.dart';
import '../modules/appointment/form_appointment/bindings/form_appointment_binding.dart';
import '../modules/appointment/form_appointment/views/form_appointment_view.dart';
import '../modules/appointment/guru_form_appointment/bindings/guru_form_appointment_binding.dart';
import '../modules/appointment/guru_form_appointment/views/guru_form_appointment_view.dart';
import '../modules/appointment/hasil_counseling/bindings/hasil_counseling_binding.dart';
import '../modules/appointment/hasil_counseling/views/hasil_counseling_view.dart';
import '../modules/appointment/home_appointment/bindings/home_appointment_binding.dart';
import '../modules/appointment/home_appointment/views/home_appointment_view.dart';
import '../modules/appointment/rekap_counseling/bindings/rekap_counseling_binding.dart';
import '../modules/appointment/rekap_counseling/views/rekap_counseling_view.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/register/bindings/register_binding.dart';
import '../modules/auth/register/views/register_view.dart';
import '../modules/auth/verifikasi/bindings/verifikasi_binding.dart';
import '../modules/auth/verifikasi/views/verifikasi_view.dart';
import '../modules/data_pribadi/bindings/data_pribadi_binding.dart';
import '../modules/data_pribadi/views/data_pribadi_view.dart';
import '../modules/guru_home/bindings/guru_home_binding.dart';
import '../modules/guru_home/views/guru_home_view.dart';
import '../modules/kuesioner/bindings/kuesioner_binding.dart';
import '../modules/kuesioner/views/kuesioner_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/user_home/bindings/home_binding.dart';
import '../modules/user_home/views/home_view.dart';
import '../modules/wali_home/bindings/wali_home_binding.dart';
import '../modules/wali_home/views/wali_home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.USER_HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.KUESIONER,
      page: () => const KuesionerView(),
      binding: KuesionerBinding(),
    ),
    GetPage(
      name: _Paths.COUNSELING_APPOINTMENT,
      page: () => const CounselingAppointmentView(),
      binding: CounselingAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFIKASI,
      page: () => const VerifikasiView(),
      binding: VerifikasiBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.DATA_PRIBADI,
      page: () => const DataPribadiView(),
      binding: DataPribadiBinding(),
    ),
    GetPage(
      name: _Paths.GURU_HOME,
      page: () => const GuruHomeView(),
      binding: GuruHomeBinding(),
    ),
    GetPage(
      name: _Paths.WALI_HOME,
      page: () => const WaliHomeView(),
      binding: WaliHomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOME_APPOINTMENT,
      page: () => const HomeAppointmentView(),
      binding: HomeAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.FORM_APPOINTMENT,
      page: () => const FormAppointmentView(),
      binding: FormAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.REKAP_COUNSELING,
      page: () => const RekapCounselingView(),
      binding: RekapCounselingBinding(),
    ),
    GetPage(
      name: _Paths.HASIL_COUNSELING,
      page: () => const HasilCounselingView(),
      binding: HasilCounselingBinding(),
    ),
    GetPage(
      name: _Paths.GURU_FORM_APPOINTMENT,
      page: () => const GuruFormAppointmentView(),
      binding: GuruFormAppointmentBinding(),
    ),
  ];
}