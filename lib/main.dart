import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models/models.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // Set the start page of the app
      home: SuccessSignUpPage(),
    );
  }
}
