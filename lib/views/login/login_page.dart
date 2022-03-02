import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/views/admin/home_page_admin.dart';
import 'package:konselingku/views/home/home_page.dart';
import 'package:konselingku/views/login/forgot_password_page.dart';
import 'package:konselingku/views/register/register_page.dart';
import 'package:konselingku/widgets/general/form_input.dart';
import 'package:konselingku/widgets/general/form_input_password.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: Get.height,
          maxWidth: Get.width,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
        ),
        child: Column(
          children: [
            _logo(),
            _content(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 90),
          child: Image.asset(
            'assets/images/kons1.png',
            height: Get.height * 0.5,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _content() {
    return Expanded(
        flex: 5,
        child: Container(
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Form(
                child: Column(
              children: [
                _emailInput(),
                SizedBox(height: 20),
                _passwordInput(),
                SizedBox(height: 20),
                _forgotPasswordButton(),
                Spacer(),
                _loginButton(),
                Spacer(),
                _registerButton(),
              ],
            )),
          ),
        ));
  }

  Widget _emailInput() {
    return formInput(
      title: 'Email',
      placeholder: 'Masukkan email',
      // controller: ,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan email terlebih dahulu';
        }
        if (!GetUtils.isEmail(value)) {
          return 'Masukkan email dengan benar';
        }
        return null;
      },
    );
  }

  // Widget _passwordInput() {
  //   return Obx(
  //     () => formInputPassword(
  //       title: 'Password',
  //       placeholder: 'Masukkan password',
  //       // controller: controller,
  //       inputAction: TextInputAction.done,
  //       // secureText: secureText,
  //       onShowPassword: () {},
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Masukkan password terlebih dahulu';
  //         }
  //         return null;
  //       },
  //     ),
  //   );
  // }

  Widget _passwordInput() {
    return formInputPassword(
      title: 'Password',
      placeholder: 'Masukkan Password',
      inputAction: TextInputAction.done,
      onShowPassword: () {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan password terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _forgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Get.to(forgotPasswordPage());
        },
        child: Text("Lupa kata sandi?",
            style: GoogleFonts.poppins(color: Colors.red)),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      // color: AppColors.primaryColor,
      width: Get.width / 1.6,
      child: GetPlatform.isIOS
          ? CupertinoButton.filled(
              disabledColor: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
              onPressed: () {
                Get.to(homePageAdmin());
              },
              child: Text("Masuk",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
              onPressed: () {
                Get.to(homePageAdmin());
              },
              child: Text("Masuk",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            ),
    );
  }

  Widget _registerButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Belum punya akun?",
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Get.to(RegisterPage());
            },
            child: Text(
              "Daftar sekarang",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
