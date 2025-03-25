import 'package:effective_flutter_lab/data/repositories/get_products_repository.dart';
import 'package:flutter/material.dart';
import '../../data/models/class_categories.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _categoryKeys = {};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (var i = 0; i < CategoriesModel.categories.length; i++) {
      final key = _categoryKeys[CategoriesModel.categories[i]];
      if (key != null) {
        final context = key.currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox;
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 100 && position.dy + box.size.height >= 100) {
            setState(() {
              selectedIndex = i;
            });
            break;
          }
        }
      }
    }
  }

  void _scrollToCategory(int index) {
    final key = _categoryKeys[CategoriesModel.categories[index]];
    if (key != null) {
      final context = key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 200),
          alignment: 0.1,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GetProductsRepository().getCategoriesTagsList();
        },
      ),
      body: Column(
        children: [
          CategorySelector(
            categories: CategoriesModel.categories,
            selectedIndex: selectedIndex,
            onItemSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
              _scrollToCategory(index);
            },
            theme: theme,
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _onScroll();
                return true;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryTItle(
                      category: 'Черный кофе',
                      key: _categoryKeys['Черный кофе'] ??= GlobalKey(),
                    ),
                    ProductList(),
                    CategoryTItle(
                      category: 'Кофе с молоком',
                      key: _categoryKeys['Кофе с молоком'] ??= GlobalKey(),
                    ),
                    ProductList(),
                    CategoryTItle(
                      category: 'Чай',
                      key: _categoryKeys['Чай'] ??= GlobalKey(),
                    ),
                    ProductList(),
                    CategoryTItle(
                      category: 'Авторские напитки',
                      key: _categoryKeys['Авторские напитки'] ??= GlobalKey(),
                    ),
                    ProductList(),
                    CategoryTItle(
                      category: 'Чаек',
                      key: _categoryKeys['Чаек'] ??= GlobalKey(),
                    ),
                    ProductList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
