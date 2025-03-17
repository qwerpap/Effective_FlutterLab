import 'package:flutter/material.dart';
import '../../../../ui/app_colors.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.theme,
  });

  final List<String> categories;
  final int selectedIndex;
  final Function(int) onItemSelected;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: categories.length,
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      selectedIndex == index
                          ? AppColors.primaryColor
                          : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  categories[index],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color:
                        selectedIndex == index
                            ? AppColors.whiteColor
                            : Colors.black,
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
