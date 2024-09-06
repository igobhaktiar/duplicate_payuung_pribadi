import 'package:duplicate_payuung_pribadi/config/app_routes.dart';
import 'package:duplicate_payuung_pribadi/config/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.pages,
      theme: AppThemes.lightTheme,
    );
  }
}
