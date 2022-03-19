import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class listApppointmentSiswa extends StatelessWidget {
  const listApppointmentSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Permintaan Konseling'),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listUserSiswa(),
        ],
      )),
    );
  }

  Widget _listUserSiswa() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vika Kusuma Dyah Tantri",
              style: GoogleFonts.poppins(),
            ),
            GestureDetector(onTap: () {}, child: Icon(Feather.chevron_right))
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 5,
          color: AppColors.grey,
        )
      ],
    );
  }
}
