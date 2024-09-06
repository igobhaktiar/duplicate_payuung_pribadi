import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavSheetController extends GetxController {
  final _selectedIndex = 0.obs;
  final _isExpanded = false.obs;

  int get selectedIndex => _selectedIndex.value;

  bool get isExpanded => _isExpanded.value;

  void setSelectedIndex(int index) => _selectedIndex.value = index;

  void toggleExpanded() => _isExpanded.toggle();

  Widget get currentScreen {
    switch (selectedIndex) {
      case 0:
        return Container(color: Colors.red);
      case 1:
        return Container(color: Colors.green);
      case 2:
        return Container(color: Colors.blue);
      case 3:
        return Container(color: Colors.yellow);
      case 4:
        return Container(color: Colors.purple);
      case 5:
        return Container(color: Colors.orange);
      case 6:
        return Container(color: Colors.pink);
      default:
        return Container(color: Colors.white);
    }
  }
}
