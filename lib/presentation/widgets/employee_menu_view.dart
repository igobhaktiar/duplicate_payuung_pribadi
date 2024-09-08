import 'package:flutter/material.dart';

class EmployeeMenuView extends StatelessWidget {
  const EmployeeMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 4,
        children: [
          _buildMenuItem('Task', Icons.assignment, Colors.blue),
          _buildMenuItem('Activity', Icons.work, Colors.green),
          _buildMenuItem('Observation', Icons.remove_red_eye, Colors.orange),
          _buildMenuItem('Report', Icons.insert_chart, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}
