import 'package:flutter/material.dart';
import 'package:pdf_reader/core/theme/colors.dart'; // adjust if needed

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.title,
    this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: greyLightColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.folder_open_outlined,
              color: primaryColor,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
