import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/constant/colors.dart';
import 'package:konselingku/widgets/general/app_bar.dart';
import 'package:konselingku/widgets/general/form_input.dart';

class forgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Lupa Password'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Form(
          child: Container(
        height: Get.height,
        child: Column(
          children: [
            _imageForgotPassword(),
            SizedBox(height: 35),
            _title(),
            SizedBox(height: 30),
            _subtitle(),
            SizedBox(height: 40),
            _emailInput(),
            SizedBox(height: 30),
            _sendButton(),
          ],
        ),
      )),
    );
  }

  Widget _imageForgotPassword() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Image.asset(
        'assets/images/forgot_password.png',
        height: Get.height * 0.25,
      ),
    );
  }

  // Widget _imageForgotPassword() {
  //   return Container(
  //     child: Column(mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Expanded(
  //           // flex: 1,
  //           child: Container(
  //             margin: EdgeInsets.only(top: 10),
  //             child: Image.asset(
  //               'assets/images/forgot_password.png',
  //               height: Get.height * 0.5,
  //               fit: BoxFit.contain,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _title() {
    return Text(
      "Lupa Password?",
      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
    );
  }

  Widget _subtitle() {
    return Text(
        "Gak papa, kami akan bantu kamu menemukan password baru. Tuliskan email kamu di kolom bawah ini ya!",
        style: GoogleFonts.poppins());
  }

  Widget _emailInput() {
    return formInput(
      title: 'Email',
      placeholder: 'Masukkan email',
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.done,
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

  _sendButton() {
    return Container(
      width: Get.width / 1.4,
      child: GetPlatform.isIOS
          ? CupertinoButton.filled(
              borderRadius: BorderRadius.circular(12),
              onPressed: () {},
              child: Text("Kirim"),
            )
          : ElevatedButton(onPressed: () {}, child: Text("Kirim"), style: ElevatedButton.styleFrom(primary: AppColors.primaryColor),),
    );
  }
}
