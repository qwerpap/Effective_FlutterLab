import 'package:effective_flutter_lab/data/models/product_model.dart';
import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectedProduct extends StatelessWidget {
  const SelectedProduct({super.key, required this.data});

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                data.imageUrl,
                height: 60,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => Icon(
                      Icons.error,
                      size: 100,
                      color: AppColors.primaryColor,
                    ),
              ),
              SizedBox(width: 16),
              Text(data.name),
            ],
          ),
          Text('${data.prices}'),
        ],
      ),
    );
  }
}
