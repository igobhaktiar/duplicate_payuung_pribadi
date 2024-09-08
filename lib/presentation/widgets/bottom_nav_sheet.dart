import 'package:duplicate_payuung_pribadi/config/constants.dart';
import 'package:duplicate_payuung_pribadi/presentation/controller/bottom_nav_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class BottomNavSheet extends GetWidget<BottomNavSheetController> {
  const BottomNavSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      children: [
        _buildNavSheet(),
        _buildArrowTrigger(),
      ],
    );
  }

  Widget _buildNavSheet() {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        controller.updateSheetHeight(controller.sheetHeight - details.delta.dy);
      },
      onVerticalDragEnd: (_) {
        if (controller.sheetHeight > 128) {
          controller.updateSheetHeight(300);
        } else {
          controller.updateSheetHeight(0);
        }
      },
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: controller.sheetHeight == 0 ? 128 : controller.sheetHeight,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(32),
            ),
            boxShadow: [
              _buildShadow(),
            ],
          ),
          child: _buildGridSheet(),
        ),
      ),
    );
  }

  BoxShadow _buildShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      offset: const Offset(0, -1),
      blurRadius: 0,
      spreadRadius: 1,
    );
  }

  Widget _buildArrowTrigger() {
    return GestureDetector(
      onTap: () {
        controller.updateSheetHeight(controller.sheetHeight == 0 ? 300 : 0);
      },
      child: Container(
        height: 20,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            _buildShadow(),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Center(
          child: Obx(
            () => Icon(
              controller.sheetHeight == 0
                  ? FeatherIcons.chevronUp
                  : FeatherIcons.chevronDown,
              color: Colors.indigo,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridSheet() {
    final List<Map<String, dynamic>> items = [
      {
        'icon': FeatherIcons.home,
        'label': 'Beranda',
        'onTap': () => controller.setSelectedIndex(0),
      },
      {
        'icon': FeatherIcons.search,
        'label': 'Cari',
        'onTap': () => controller.setSelectedIndex(1),
      },
      {
        'icon': FeatherIcons.shoppingCart,
        'label': 'Keranjang',
        'onTap': () => controller.setSelectedIndex(2),
      },
      {
        'icon': FeatherIcons.clipboard,
        'label': 'Daftar Transaksi',
        'onTap': () => controller.setSelectedIndex(3),
      },
      {
        'icon': FeatherIcons.creditCard,
        'label': 'Voucher Saya',
        'onTap': () => controller.setSelectedIndex(4),
      },
      {
        'icon': FeatherIcons.mapPin,
        'label': 'Alamat Pengiriman',
        'onTap': () => controller.setSelectedIndex(5),
      },
      {
        'icon': FeatherIcons.users,
        'label': 'Daftar Teman',
        'onTap': () => controller.setSelectedIndex(6),
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildGridItem(items[index], index),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item, int index) {
    return Obx(() {
      return GestureDetector(
        onTap: item['onTap'],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item['icon'],
              size: 32,
              color: controller.selectedIndex == index
                  ? Constants.primaryColor
                  : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              item['label'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: controller.selectedIndex == index
                      ? Constants.primaryColor
                      : Colors.grey),
            ),
          ],
        ),
      );
    });
  }
}
