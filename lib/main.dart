import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
