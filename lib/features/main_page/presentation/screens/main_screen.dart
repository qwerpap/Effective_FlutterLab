import 'package:effective_flutter_lab/features/main_page/data/categories_model.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final CategoriesModel categoriesModel = CategoriesModel();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategorySelector(
              categories: CategoriesModel.categories,
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              theme: theme,
            ),
            CategoryTItle(category: 'Черный кофе'),
            ProductList(),
            CategoryTItle(category: 'Кофе с молоком'),
            ProductList(),
            CategoryTItle(category: 'Чай'),
            ProductList(),
            CategoryTItle(category: 'Чаек'),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
