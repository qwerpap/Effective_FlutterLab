import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int current = 0;

  void _addToCart() {
    setState(() {
      current = 1;
    });
  }

  void _increment() {
    if (current < 10) {
      setState(() {
        current++;
      });
    }
  }

  void _decrement() {
    if (current > 1) {
      setState(() {
        current--;
      });
    } else {
      setState(() {
        current = 0;
      });
    }
  }

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
            fit: BoxFit.contain,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(Icons.error, size: 100, color: AppColors.primaryColor),
          ),
          SizedBox(height: 8),
          Text('Олеато', style: theme.textTheme.bodyLarge),
          SizedBox(height: 8),
          current == 0
              ? ElevatedButton(
                onPressed: () {
                  _addToCart();
                },
                child: Text('139 руб', style: theme.textTheme.bodySmall),
              )
              : Container(
                width: 116,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: _decrement,
                      icon: Icon(Icons.remove),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                    Text(
                      '$current',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: _increment,
                      icon: Icon(Icons.add),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
