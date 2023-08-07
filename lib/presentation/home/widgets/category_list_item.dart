import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isVisible;

  CategoryListItem({
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
      title: Text(title),
      onTap: onTap,
    );
  }
}
