import 'package:duplicate_payuung_pribadi/presentation/widgets/explore_wellness_widget.dart';
import 'package:flutter/material.dart';

class PersonalMenuView extends StatelessWidget {
  const PersonalMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuOptions(),
        const ExploreWellnessWidget(),
      ],
    );
  }

  Widget _buildMenuOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Produk Keuangan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildMenuItem(Icons.group, 'Urun', Colors.brown, isNew: true),
            _buildMenuItem(
                Icons.mosque, 'Pembiayaan\nPorsi Haji', Colors.green),
            _buildMenuItem(
                Icons.insert_chart, 'Financial\nCheck Up', Colors.blue),
            _buildMenuItem(
                Icons.directions_car, 'Asuransi\nMobil', Colors.orange),
            _buildMenuItem(Icons.home, 'Asuransi\nProperti', Colors.purple),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Kategori Pilihan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16),
                    SizedBox(width: 4),
                    Text('Wishlist 0'),
                  ],
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildMenuItem(Icons.umbrella, 'Hobi', Colors.red),
            _buildMenuItem(Icons.shopping_bag, 'Merchandise', Colors.blue),
            _buildMenuItem(Icons.favorite, 'Gaya Hidup\nSehat', Colors.green),
            _buildMenuItem(
                Icons.psychology, 'Konseling &\nRohani', Colors.purple),
            _buildMenuItem(
                Icons.psychology, 'Self\nDevelopment', Colors.orange),
            _buildMenuItem(Icons.account_balance_wallet,
                'Perencanaan\nKeuangan', Colors.brown),
            _buildMenuItem(Icons.medical_services, 'Konsultasi', Colors.blue),
            _buildMenuItem(Icons.grid_view, 'Lihat Semua', Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String label, Color color,
      {bool isNew = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(icon, size: 40, color: color),
            if (isNew)
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
