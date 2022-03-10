import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/constant/enum.dart';
import 'package:konselingku/app/widget/general/form_input.dart';
import 'package:konselingku/app/widget/general/form_input_password.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  _logo(),
                  const SizedBox(height: 35),
                  _title(),
                  const SizedBox(height: 5),
                  _subtitle(),
                  const SizedBox(height: 20),
                  _nameInput(
                      controller.textController[RegisterFormType.namaLengkap]!),
                  const SizedBox(height: 20),
                  _callNameInput(controller
                      .textController[RegisterFormType.namaPanggilan]!),
                  const SizedBox(height: 20),
                  _emailInput(
                      controller.textController[RegisterFormType.email]!),
                  const SizedBox(height: 20),
                  // _userInput(),
                  // SizedBox(height: 20),
                  _phoneInput(
                      controller.textController[RegisterFormType.noTelepon]!),
                  const SizedBox(height: 20),
                  _dropdownRole(),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (controller.role == 2) {
                      return _nipInput(
                          controller.textController[RegisterFormType.nip]!);
                    } else if (controller.role == 1) {
                      return _emailAnakInput(controller
                          .textController[RegisterFormType.emailAnak]!);
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                  Obx(() => controller.role != 0
                      ? const SizedBox(height: 20)
                      : const SizedBox.shrink()),
                  _passwordInput(
                      controller.textController[RegisterFormType.password]!),
                  const SizedBox(height: 20),
                  _rePasswordInput(controller
                      .textController[RegisterFormType.passwordConfirm]!),
                  const SizedBox(height: 40),
                  _registerButton(),
                  const SizedBox(height: 50),
                  _goToLoginButton(),
                ],
              )),
        ));
  }

  Widget _logo() {
    return Center(
      child: Image.asset(
        'assets/images/kons3.png',
        height: 50,
      ),
    );
  }

  Widget _title() {
    return Container(
      alignment: Alignment.topLeft,
      // margin: EdgeInsets.only(left: 10),
      child: Text(
        "Hai Selamat Datang!",
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget _subtitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "Yuk Lengkapi dulu formulir pendaftaran di bawah ini!",
        style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
      ),
    );
  }

  Widget _nameInput(TextEditingController controller) {
    return formInput(
      controller: controller,
      title: "Nama Lengkap",
      placeholder: "Masukkan nama lengkapmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nama lengkapmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _nipInput(TextEditingController controller) {
    return formInput(
      controller: controller,
      title: "NIP/NIK",
      placeholder: "Masukkan NIP/NIK",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan NIP/NIK terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _callNameInput(TextEditingController controller) {
    return formInput(
      controller: controller,
      title: "Nama Panggilan",
      placeholder: "Masukkan nama panggilanmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nama panggilanmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _emailInput(TextEditingController controller) {
    return formInput(
      controller: controller,
      title: "Email",
      placeholder: "Masukkan emailmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan emailmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _emailAnakInput(TextEditingController controller) {
    return formInput(
      controller: controller,
      title: "Email Anak",
      placeholder: "Masukkan email anakmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan email anakmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _phoneInput(TextEditingController controller) {
    return formInput(
      controller: controller,
      title: "No. Telepon",
      placeholder: "Masukkan nomer teleponmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan nomer teleponmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _dropdownRole() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text("Role",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<int>(
          value: controller.role,
          isExpanded: true,
          items: const [
            DropdownMenuItem(value: 0, child: Text("Siswa")),
            DropdownMenuItem(value: 1, child: Text("Wali Murid")),
            DropdownMenuItem(value: 2, child: Text("Guru"))
          ],
          onChanged: (val) {
            if (val != null) {
              controller.role = val;
            }
          },
          decoration: InputDecoration(
              hintText: "Role",
              hintStyle: GoogleFonts.poppins(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.primaryColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        )
      ],
    );
  }

  Widget _passwordInput(TextEditingController controller) {
    return Obx(
      () => formInputPassword(
        controller: controller,
        title: "Password",
        placeholder: "Masukkan passwordmu",
        inputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan passwordmu terlebih dahulu';
          }
          return null;
        },
        onShowPassword: () {
          this.controller.tooglePassword(PassowrdType.standard);
        },
        showPassword: this.controller.showPassword(PassowrdType.standard),
      ),
    );
  }

  Widget _rePasswordInput(TextEditingController controller) {
    return Obx(
      () => formInputPassword(
        controller: controller,
        title: "Konfirmasi Password",
        placeholder: "Masukkan passwordmu",
        inputAction: TextInputAction.next,
        validateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Masukkan passwordmu terlebih dahulu';
          }
          if (value !=
              this.controller.textController[RegisterFormType.password]!.text) {
            return "Password tidak sama";
          }
          return null;
        },
        onShowPassword: () {
          this.controller.tooglePassword(PassowrdType.confirm);
        },
        showPassword: this.controller.showPassword(PassowrdType.confirm),
      ),
    );
  }

  Widget _registerButton() {
    return SizedBox(
      // color: AppColors.primaryColor,
      width: Get.width / 1.6,
      child: GetPlatform.isIOS
          ? CupertinoButton.filled(
              disabledColor: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                controller.register();
              },
              child: Text("Daftar",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
              onPressed: () {
                controller.register();
              },
              child: Text("Kirim",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            ),
    );
  }

  Widget _goToLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sudah punya akun?",
          style: GoogleFonts.poppins(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            "Masuk",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
