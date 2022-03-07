import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';
import 'package:konselingku/app/widget/general/form_input.dart';

class detailUser extends StatelessWidget {
  const detailUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Detail Akun'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Form(
          child: Column(
        children: [
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
          _dropdownRole(),
          SizedBox(height: 40),
          _registerButton(),
          SizedBox(height: 50),
        ],
      )),
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
      inputType: TextInputType.emailAddress,
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
      inputType: TextInputType.number,
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
    return formInput(
        title: "Role",
        placeholder: "Plihan role user",
        inputType: TextInputType.text,
        inputAction: TextInputAction.next,
        validator: (value) {});
  }

  Widget _registerButton() {
    return Container(
      child: Row(
        children: [
          Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.red)),
            child: Center(
              child: Text(
                "Tolak",
                style: GoogleFonts.poppins(
                    color: AppColors.red, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 50),
          Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.kBlue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
        ],
      ),
    );
  }
}
