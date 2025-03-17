import 'package:flutter/material.dart';

class CategoryTItle extends StatelessWidget {
  const CategoryTItle({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(category, style: theme.textTheme.titleLarge),
    );
  }
}