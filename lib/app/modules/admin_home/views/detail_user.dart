import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/data/model/user.dart';
import 'package:konselingku/app/data/repository/user_repository.dart';
import 'package:konselingku/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:konselingku/app/routes/app_pages.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/dialog.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

class DetailUser extends GetView<AdminHomeController> {
  DetailUser({Key? key}) : super(key: key);
  final UserData user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Detail Akun'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Form(
          child: Column(
        children: [
          _nameInput(),
          const SizedBox(height: 20),
          _callNameInput(),
          const SizedBox(height: 20),
          _emailInput(),
          const SizedBox(height: 20),
          // _userInput(),
          // SizedBox(height: 20),
          _phoneInput(),
          const SizedBox(height: 20),
          _dropdownRole(),
          user.role != "0"
              ? const SizedBox(height: 20)
              : const SizedBox.shrink(),
          user.role == "1" ? _emailAnakInput() : const SizedBox.shrink(),
          user.role == "1"
              ? const SizedBox(height: 20)
              : const SizedBox.shrink(),
          user.role == "2" ? _nipInput() : const SizedBox.shrink(),
          user.role == "2"
              ? const SizedBox(height: 20)
              : const SizedBox.shrink(),
          const SizedBox(height: 40),
          !user.isAccept ? _registerButton() : const SizedBox.shrink(),
          const SizedBox(height: 50),
        ],
      )),
    );
  }

  Widget _nameInput() {
    return formInput(
      title: "Nama Lengkap",
      placeholder: "Masukkan nama lengkapmu",
      inputType: TextInputType.text,
      intialValue: user.namaLengkap,
      inputAction: TextInputAction.next,
      enabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nama lengkapmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _nipInput() {
    return formInput(
      title: "NIP/NIK",
      placeholder: "NIP/NIK",
      inputType: TextInputType.text,
      intialValue: user.nip,
      inputAction: TextInputAction.next,
      enabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'NIP/NIK';
        }
        return null;
      },
    );
  }

  Widget _emailAnakInput() {
    return formInput(
      title: "Email Anak",
      placeholder: "Email Anak",
      inputType: TextInputType.text,
      intialValue: user.emailAnak,
      inputAction: TextInputAction.next,
      enabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email Anak';
        }
        return null;
      },
    );
  }

  Widget _callNameInput() {
    return formInput(
      title: "Nama Panggilan",
      placeholder: "Masukkan nama panggilanmu",
      intialValue: user.namaPanggilan,
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      enabled: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nama panggilanmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _emailInput() {
    return formInput(
        title: "Email",
        placeholder: "Masukkan emailmu",
        inputType: TextInputType.emailAddress,
        inputAction: TextInputAction.next,
        enabled: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan emailmu terlebih dahulu';
          }
          return null;
        },
        intialValue: user.email);
  }

  Widget _phoneInput() {
    return formInput(
        title: "No. Telepon",
        placeholder: "Masukkan nomer teleponmu",
        inputType: TextInputType.number,
        inputAction: TextInputAction.next,
        enabled: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan nomer teleponmu terlebih dahulu';
          }
          return null;
        },
        intialValue: user.noTelp);
  }

  Widget _dropdownRole() {
    String role = '';
    switch (user.role) {
      case "0":
        role = "Siswa";
        break;
      case "1":
        role = "Orang Tua / Wali Murid";
        break;
      case "2":
        role = "Guru";
        break;
      default:
    }
    return formInput(
        intialValue: role,
        title: "Role",
        placeholder: "Plihan role user",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        enabled: false,
        validator: (value) {});
  }

  Widget _registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () async {
            CustomDialog.loadingDialog();
            await UserRepository.instance.blockAccount(user.uid);
            await controller.fetchData();
            Get.until((route) => Get.currentRoute == Routes.ADMIN_HOME);
          },
          child: Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.red)),
            child: Center(
              child: Text(
                "Tolak",
                style: GoogleFonts.poppins(
                    color: AppColors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            CustomDialog.loadingDialog();
            await UserRepository.instance.acceptAccount(user.uid);
            await controller.fetchData();
            Get.until((route) => Get.currentRoute == Routes.ADMIN_HOME);
          },
          child: Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.kBlue,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: AppColors.kBlue),
            ),
            child: Center(
              child: Text(
                "Setuju",
                style: GoogleFonts.poppins(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
