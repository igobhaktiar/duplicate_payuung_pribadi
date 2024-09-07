import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavSheetController extends GetxController {
  final _selectedIndex = 0.obs;
  final _sheetHeight = 0.0.obs;

  int get selectedIndex => _selectedIndex.value;

  double get sheetHeight => _sheetHeight.value;

  void setSelectedIndex(int index) => _selectedIndex.value = index;

  void updateSheetHeight(double height) {
    _sheetHeight.value = height.clamp(0, 300);
  }

  Widget get currentScreen {
    switch (selectedIndex) {
      case 0:
        return Container(color: Colors.white);
      case 1:
        return Container(color: Colors.green);
      case 2:
        return Container(color: Colors.blue);
      default:
        return Container(color: Colors.white);
    }
  }

}
