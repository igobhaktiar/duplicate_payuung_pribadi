import 'package:duplicate_payuung_pribadi/config/constants.dart';
import 'package:duplicate_payuung_pribadi/presentation/widgets/employee_menu_view.dart';
import 'package:duplicate_payuung_pribadi/presentation/widgets/personal_menu_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Column(
        children: [
          _buildHeader(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              _buildToggleTab(),
              const SizedBox(height: 8),
              Divider(
                height: 1,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 16),
              // tab view
              Obx(() {
                return IndexedStack(
                  index: controller.selectedIndex.value,
                  children: const [
                    PersonalMenuView(),
                    EmployeeMenuView(),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleTab() {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(16),
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: controller.selectedIndex.value == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: Get.width * 0.5 - 16,
                height: 40,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Row(
              children: [
                _buildToggleButton(0, 'Payuung Pribadi'),
                _buildToggleButton(1, 'Payuung Karyawan'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(int index, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: controller.selectedIndex.value == index
                  ? Colors.white
                  : Colors.grey[400],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.dayTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Row(
              children: [
                Icon(
                  FeatherIcons.bell,
                  color: Colors.white,
                  size: 28,
                ),
                SizedBox(width: 16),
                CircleAvatar(
                  radius: 24,
                  child: Icon(
                    FluentIcons.person_48_filled,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
