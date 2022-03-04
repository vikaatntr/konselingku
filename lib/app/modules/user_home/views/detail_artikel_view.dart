import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konselingku/app/data/model/artikel.dart';
import 'package:konselingku/app/widget/general/app_bar.dart';

class DetailArtikel extends StatelessWidget {
  final Artikel artikel;
  const DetailArtikel({Key? key, required this.artikel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: artikel.judul),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            artikel.judul,
            style: Get.textTheme.headline5!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                artikel.dateCreated.toDate().toString().split('.')[0],
                style: Get.textTheme.caption!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          AspectRatio(
            aspectRatio: 1.75,
            child: Image.network(
              artikel.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            artikel.deskripsi,
            style: Get.textTheme.bodyText1,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
