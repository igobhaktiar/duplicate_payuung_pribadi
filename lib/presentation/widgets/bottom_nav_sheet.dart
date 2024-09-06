import 'package:duplicate_payuung_pribadi/presentation/controller/bottom_nav_sheet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavSheet extends GetWidget<BottomNavSheetController> {
  const BottomNavSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildArrowTrigger(),
        Obx(() => controller.isExpanded
            ? _buildExpandedSheet()
            : _buildBottomNavBar())
      ],
    );
  }

  Widget _buildArrowTrigger() {
    return GestureDetector(
      onTap: controller.toggleExpanded,
      child: Container(
        height: 20,
        color: Colors.white,
        child: Center(
          child: Obx(
            () => AnimatedRotation(
              turns: controller.isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 300),
              child: Icon(Icons.keyboard_arrow_up, color: Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(
      () => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),
        ],
        currentIndex: controller.selectedIndex,
        onTap: controller.setSelectedIndex,
      ),
    );
  }

  Widget _buildExpandedSheet() {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Beranda'),
                onTap: () => controller.setSelectedIndex(0),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Cari'),
                onTap: () => controller.setSelectedIndex(1),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Keranjang'),
                onTap: () => controller.setSelectedIndex(2),
              ),
              ListTile(
                leading: const Icon(Icons.receipt),
                title: const Text('Daftar Transaksi'),
                onTap: () => controller.setSelectedIndex(3),
              ),
              ListTile(
                leading: const Icon(Icons.card_giftcard),
                title: const Text('Voucher Saya'),
                onTap: () => controller.setSelectedIndex(4),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Alamat Pengiriman'),
                onTap: () => controller.setSelectedIndex(5),
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Daftar Teman'),
                onTap: () => controller.setSelectedIndex(6),
              ),
            ],
          ),
        );
      },
    );
  }
}
