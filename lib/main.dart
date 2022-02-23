import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:konselingku/routes/pages.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
