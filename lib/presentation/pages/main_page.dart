import 'package:duplicate_payuung_pribadi/presentation/controller/bottom_nav_sheet_controller.dart';
import 'package:duplicate_payuung_pribadi/presentation/widgets/bottom_nav_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<BottomNavSheetController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        body: Stack(
          children: [
            controller.currentScreen,
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottomNavSheet(),
            ),
          ],
        ),
      );
    });
  }
}
