import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';

Widget formInput(
    {required String title,
    String? intialValue,
    required String placeholder,
    FocusNode? focusNode,
    // required controller,
    required TextInputType inputType,
    required TextInputAction inputAction,
    bool secureText = false,
    bool enabled = true,
    TextEditingController? controller,
    required validator}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      TextFormField(
        initialValue: intialValue,
        controller: controller,
        focusNode: focusNode,
        // controller: controller,
        onChanged: (text) => {},
        keyboardType: inputType,
        textInputAction: inputAction,
        obscureText: secureText,
        enabled: enabled,
        decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.poppins(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.2))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(width: 1, color: AppColors.primaryColor)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.2)),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
      ),
    ],
  );
}
