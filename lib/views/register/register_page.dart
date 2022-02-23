import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/widgets/general/form_input.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 20, 30, 20),
          child: Form(
              child: Column(
            children: [
              SizedBox(height: 30),
              _logo(),
              SizedBox(height: 35),
              _title(),
              SizedBox(height: 5),
              _subtitle(),
              SizedBox(height: 20),
              _nameInput(),
              SizedBox(height: 20),
              _callNameInput(),
              SizedBox(height: 20),
              _emailInput(),
              SizedBox(height: 20),
              // _userInput(),
              // SizedBox(height: 20),
              _phoneInput(),
              SizedBox(height: 20),
              _passwordInput(),
              SizedBox(height: 20),
              _rePasswordInput(),
              SizedBox(height: 40),
              _registerButton(),
              SizedBox(height: 50),
              _goToLoginButton(),
            ],
          )),
        ));
  }

  Widget _logo() {
    return Container(
      child: Center(
        child: Image.asset(
          'assets/images/kons3.png',
          height: 50,
        ),
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

  Widget _nameInput() {
    return formInput(
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

  Widget _callNameInput() {
    return formInput(
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

  Widget _emailInput() {
    return formInput(
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

  Widget _phoneInput() {
    return formInput(
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

  Widget _passwordInput() {
    return formInput(
      title: "Password",
      placeholder: "Masukkan passwordmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan passwordmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _rePasswordInput() {
    return formInput(
      title: "Ulangi Password",
      placeholder: "Masukkan kembali passwordmu",
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan kembali passwordmu terlebih dahulu';
        }
        return null;
      },
    );
  }

  Widget _registerButton() {
    return Container(
      // color: AppColors.primaryColor,
      width: Get.width / 1.6,
      child: GetPlatform.isIOS
          ? CupertinoButton.filled(
              disabledColor: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12),
              onPressed: () {},
              child: Text("Daftar",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),
              onPressed: () {},
              child: Text("Kirim",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            ),
    );
  }

  Widget _goToLoginButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sudah punya akun?",
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
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
      ),
    );
  }
}
