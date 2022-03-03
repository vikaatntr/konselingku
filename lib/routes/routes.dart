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
    GetPage(name: _Paths.HOMEPAGE, page: () => HomePage()),
    GetPage(name: _Paths.HOMEPAGE_ADMIN, page: () => homePageAdmin()),
    GetPage(name: _Paths.NOTIFICATION, page: () => notificationPage()),
    GetPage(name: _Paths.PROFILE, page: () => profilePage()),
    GetPage(name: _Paths.COUNSELING_APPOINTMENT, page: () => appointmentPage()),
    GetPage(name: _Paths.INFORMATION_KUESIONER, page: () => informationKuesionerPage()),
    GetPage(name: _Paths.KUESIONER, page: () => kuesionerPage()),
    GetPage(name: _Paths.HOMEPAGE_DATA_PRIBADI, page: () => homeDataPribadi()),
    GetPage(name: _Paths.MENU_DATA_PRIBADI, page: () => menuDataPribadi()),
    GetPage(name: _Paths.INFO_DATA_SISWA, page: () => infoDataSiswa()),
    GetPage(name: _Paths.INFO_DATA_PRIBADI, page: () => infoDataPribadi()),
    GetPage(name: _Paths.INFO_DATA_ORTU, page: () => infoDataOrtu()),
    GetPage(name: _Paths.KET_LINGKUNGAN_KEL, page: () => ketLingkunganKel()),
  ];
}
