import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isVisible;

  const CategoryListItem({
    super.key,
    required this.title,
    required this.onTap,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return const SizedBox.shrink();
    }

    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
