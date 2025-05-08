import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MapListScreen extends StatelessWidget {
  const MapListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Row(children: [Text('Наши кофейни')]),
      ),
    );
  }
}
