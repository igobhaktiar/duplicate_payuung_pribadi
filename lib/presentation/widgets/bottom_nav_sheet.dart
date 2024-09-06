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
    final List<Map<String, dynamic>> items = [
      {
        'icon': Icons.home,
        'label': 'Beranda',
        'onTap': () => controller.setSelectedIndex(0)
      },
      {
        'icon': Icons.search,
        'label': 'Cari',
        'onTap': () => controller.setSelectedIndex(1)
      },
      {
        'icon': Icons.shopping_cart,
        'label': 'Keranjang',
        'onTap': () => controller.setSelectedIndex(2)
      },
      {'icon': Icons.receipt, 'label': 'Daftar Transaksi', 'onTap': () {}},
      {'icon': Icons.card_giftcard, 'label': 'Voucher Saya', 'onTap': () {}},
      {'icon': Icons.location_on, 'label': 'Alamat Pengiriman', 'onTap': () {}},
      {'icon': Icons.people, 'label': 'Daftar Teman', 'onTap': () {}},
      {'icon': Icons.account_circle, 'label': 'Profil', 'onTap': () {}},
    ];

    return SizedBox(
      height: 300,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildGridItem(items[index]);
        },
      ),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item) {
    return InkWell(
      onTap: item['onTap'],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item['icon'], size: 32, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            item['label'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
