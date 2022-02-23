// import 'package:get/get.dart';
// import 'package:konselingku/main.dart';
// import 'package:konselingku/routes/pages.dart';
// import 'package:konselingku/views/splash/splash_screen.dart';

part of 'pages.dart';

class AppRoutes {
  static const INITIAL = AppPages.SPLASH;

  static final pages = [
    GetPage(name: _Paths.SPLASH, page: () => SplashScreen()),
    GetPage(name: _Paths.LOGIN, page: () => LoginPage()),
    GetPage(name: _Paths.FORGOT_PASSWORD, page: () => forgotPasswordPage()),
    GetPage(name: _Paths.REGISTER, page: () => RegisterPage()),
    GetPage(name: _Paths.NOTIFICATION, page: () => notificationPage()),
    GetPage(name: _Paths.COUNSELING_APPOINTMENT, page: () => appointmentPage()),
    GetPage(name: _Paths.INFORMATION_KUESIONER, page: () => informationKuesionerPage()),
    GetPage(name: _Paths.KUESIONER, page: () => kuesionerPage())
  ];
}
