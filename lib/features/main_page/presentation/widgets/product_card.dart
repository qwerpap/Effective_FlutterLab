import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(
        children: [
          Image.asset(
            'assets/png/coffe_image.png',
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text('Олеато', style: theme.textTheme.bodyLarge),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text('139 руб', style: theme.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
