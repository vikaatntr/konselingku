// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:konselingku/app/modules/data_pribadi/views/informasi_aktivitas_kelompok.dart';
import 'package:konselingku/app/modules/data_pribadi/views/informasi_data_orang_tua.dart';
import 'package:konselingku/app/modules/data_pribadi/views/informasi_data_siswa.dart';
import 'package:konselingku/app/modules/data_pribadi/views/informasi_kondisi_fisik_psikis.dart';
import 'package:konselingku/app/modules/data_pribadi/views/informasi_rencana_masa_depan.dart';
import 'package:konselingku/app/modules/data_pribadi/views/keterangan_lingkungan%20keluarga.dart';
import 'package:konselingku/app/modules/data_pribadi/views/menu_data_pribadi.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/views/hasil_poin_pelanggaran.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/views/list_siswa.dart';
import 'package:konselingku/app/modules/poin_pelanggaran/views/poin_pelanggaran_guru.dart';

import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_home/views/detail_user.dart';
import '../modules/admin_home/views/list_user.dart';
import '../modules/appointment/guru/guru_counseling_appointment/bindings/guru_counseling_appointment_binding.dart';
import '../modules/appointment/guru/guru_counseling_appointment/views/guru_counseling_appointment_view.dart';
import '../modules/appointment/guru/guru_form_appointment/bindings/guru_form_appointment_binding.dart';
import '../modules/appointment/guru/guru_form_appointment/views/guru_form_appointment_view.dart';
import '../modules/appointment/guru/guru_home_appointment/bindings/guru_home_appointment_binding.dart';
import '../modules/appointment/guru/guru_home_appointment/views/guru_home_appointment_view.dart';
import '../modules/appointment/guru/guru_rekap_counseling/bindings/guru_rekap_counseling_binding.dart';
import '../modules/appointment/guru/guru_rekap_counseling/views/guru_rekap_counseling_view.dart';
import '../modules/appointment/siswa/counseling_appointment/bindings/counseling_appointment_binding.dart';
import '../modules/appointment/siswa/counseling_appointment/views/counseling_appointment_view.dart';
import '../modules/appointment/siswa/form_appointment/bindings/form_appointment_binding.dart';
import '../modules/appointment/siswa/form_appointment/views/form_appointment_view.dart';
import '../modules/appointment/siswa/hasil_counseling/bindings/hasil_counseling_binding.dart';
import '../modules/appointment/siswa/hasil_counseling/views/hasil_counseling_view.dart';
import '../modules/appointment/siswa/home_appointment/bindings/home_appointment_binding.dart';
import '../modules/appointment/siswa/home_appointment/views/home_appointment_view.dart';
import '../modules/appointment/siswa/rekap_counseling/bindings/rekap_counseling_binding.dart';
import '../modules/appointment/siswa/rekap_counseling/views/rekap_counseling_view.dart';
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
import '../modules/data_pribadi/views/informasi_data_pribadi.dart';
import '../modules/guru_home/bindings/guru_home_binding.dart';
import '../modules/guru_home/views/guru_home_view.dart';
import '../modules/kuesioner/bindings/kuesioner_binding.dart';
import '../modules/kuesioner/bindings/list_kuesioner_binding.dart';
import '../modules/kuesioner/views/hasil_kuesioner.dart';
import '../modules/kuesioner/views/informasi_kuesioner_view.dart';
import '../modules/kuesioner/views/kuesioner_view.dart';
import '../modules/kuesioner/views/list_kuesioner.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/poin_pelanggaran/bindings/poin_pelanggaran_binding.dart';
import '../modules/poin_pelanggaran/views/poin_pelanggaran_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/user_home/bindings/home_binding.dart';
import '../modules/user_home/views/home_view.dart';
import '../modules/wali_home/bindings/wali_home_binding.dart';
import '../modules/wali_home/views/wali_home_view.dart';

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
    ),
    GetPage(
      name: _Paths.HASILKUESIONER,
      page: () => const HasilKuesioner(),
      binding: KuesionerBinding(),
    ),
    GetPage(
      name: _Paths.INFORMASIKUESIONER,
      page: () => const InformasiKuesionerView(),
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
        children: [
          GetPage(
            name: _Paths.LIST_USER,
            page: () => const ListUser(),
          ),
          GetPage(name: _Paths.DETAIL_USER, page: () => DetailUser())
        ]),
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
      page: () => HasilCounselingView(),
      binding: HasilCounselingBinding(),
    ),
    GetPage(
      name: _Paths.GURU_FORM_APPOINTMENT,
      page: () => const GuruFormAppointmentView(),
      binding: GuruFormAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.GURU_HOME_APPOINTMENT,
      page: () => const GuruHomeAppointmentView(),
      binding: GuruHomeAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.GURU_REKAP_COUNSELING,
      page: () => const GuruRekapCounselingView(),
      binding: GuruRekapCounselingBinding(),
    ),
    GetPage(
      name: _Paths.GURU_COUNSELING_APPOINTMENT,
      page: () => const GuruCounselingAppointmentView(),
      binding: GuruCounselingAppointmentBinding(),
    ),
    GetPage(
        name: _Paths.LIST_KUESIONER,
        page: () => const ListKuesioner(),
        binding: ListKuesionerBinding()),
    GetPage(
        name: _Paths.POIN_PELANGGARAN,
        page: () => const PoinPelanggaranView(),
        binding: PoinPelanggaranBinding(),
        children: [
          GetPage(
            name: _Paths.LIST_SISWA_POIN_PELANGGARAN,
            page: () => const ListSiswaPoinPelanggaran(),
            binding: PoinPelanggaranBinding(),
          ),
          GetPage(
            name: _Paths.POIN_PELANGGARAN_SISWA,
            page: () => PoinPelanggaranSiswa(),
            binding: PoinPelanggaranBinding(),
          ),
          GetPage(
            name: _Paths.POIN_PELANGGARAN_HASIL,
            page: () => HasilPoinPelanggaran(),
            binding: PoinPelanggaranBinding(),
          ),
        ]),
    GetPage(
        name: _Paths.MENU_DATA_PRIBADI,
        page: () => const MenuDataPribadiView(),
        binding: DataPribadiBinding(),
        children: [
          GetPage(
            name: _Paths.FORM_DATA_SISWA,
            page: () => InfoDataSiswaView(),
            binding: DataPribadiBinding(),
          ),
          GetPage(
            name: _Paths.FORM_DATA_SISWA_PRIBADI,
            page: () => InfoDataPribadiView(),
            binding: DataPribadiBinding(),
          ),
          GetPage(
            name: _Paths.FORM_DATA_ORTU,
            page: () => const InfoDataOrtuView(),
            binding: DataPribadiBinding(),
          ),
          GetPage(
            name: _Paths.FORM_LINGKUNGAN_KELUARGA,
            page: () => const KetLingkunganKelView(),
            binding: DataPribadiBinding(),
          ),
          GetPage(
            name: _Paths.FORM_KONDISI_FISIK_PSIKIS,
            page: () => const KondisiFisikPsikisView(),
            binding: DataPribadiBinding(),
          ),
          GetPage(
            name: _Paths.FORM_AKTIVITAS_KELOMPOK,
            page: () => const AktivitasKelompokView(),
            binding: DataPribadiBinding(),
          ),
          GetPage(
            name: _Paths.FORM_RENCANA_MASADEPAN,
            page: () => const RencanaMasaDepanView(),
            binding: DataPribadiBinding(),
          ),
        ]),
  ];
}
