import 'package:flutter/material.dart';

class RecipeInfoRow extends StatelessWidget {
  final int readyInMinutes;
  final int ingredientsCount;
  final int healthScore;

  const RecipeInfoRow({
    super.key,
    required this.readyInMinutes,
    required this.ingredientsCount,
    required this.healthScore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoColumn(Icons.access_time_outlined, '$readyInMinutes mins'),
          _buildInfoColumn(null, '$ingredientsCount', label: 'Ingredients'),
          _buildInfoColumn(null, '$healthScore', label: 'Health Score'),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(IconData? icon, String text, {String? label}) {
    return Column(
      children: [
        if (icon != null)
          Icon(icon, size: 20.0, color: const Color(0xFF01937c)),
        const SizedBox(height: 4.0),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF01937c),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (label != null) const SizedBox(height: 4.0),
        if (label != null)
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
