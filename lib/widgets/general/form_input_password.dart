import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colors.dart';

Widget formInputPassword(
    {required String title,
    required String placeholder,
    // required controller,
    required TextInputAction inputAction,
    // required bool secureText,
    required onShowPassword,
    required validator}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      SizedBox(height: 8),
      TextFormField(
        // controller: controller,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: inputAction,
        // obscureText: secureText,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: GoogleFonts.poppins(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: AppColors.primaryColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          suffixIcon: IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 22,
            color: Colors.grey,
            onPressed: onShowPassword,
            icon: Icon(Feather.eye),
          ),
        ),
        validator: validator,
      )
    ],
  );
}
