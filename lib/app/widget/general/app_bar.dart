import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';

PreferredSizeWidget appBar(
    {required String title,
    double? elevation,
    bool canBack = true,
    Widget? customLeading,
    bool enableLeading = true,
    List<Widget>? actions,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    toolbarHeight: 65,
    backgroundColor: AppColors.white,
    centerTitle: true,
    elevation: elevation,
    title: Text(title, style: GoogleFonts.poppins(color: AppColors.black)),
    leading: canBack
        ? customLeading ??
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Feather.chevron_left,
                size: 32,
                color: AppColors.black,
              ),
            )
        : null,
    automaticallyImplyLeading: enableLeading ? true : false,
    actions: actions,
    bottom: bottom,
  );
}
