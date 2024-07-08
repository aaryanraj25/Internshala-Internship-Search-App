import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/splash_screen.dart';
import 'controllers/internship_controller.dart';
import 'controllers/filters_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship Search',
      initialBinding: BindingsBuilder(() {
        Get.put(InternshipController());
        Get.put(FiltersController());
      }),
      home: SplashScreen(),
    );
  }
}
