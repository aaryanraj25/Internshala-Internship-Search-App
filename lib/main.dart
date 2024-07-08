import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/controllers/internship_controller.dart';
import 'package:internshala/controllers/filters_controller.dart';
import 'package:internshala/views/splash_screen.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Set the scaffold background color to white
      ),
    );
  }
}
