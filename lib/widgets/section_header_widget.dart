import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String seeMore;

  const SectionHeader({
    super.key,
    required this.title,
    required this.seeMore,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              seeMore,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF01937c),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
