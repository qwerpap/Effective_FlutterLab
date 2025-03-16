import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> categories;
    categories = [
      'Черный кофе',
      'Кофе с молоком',
      'Чай',
      'Авторские напитки',
      'Чаек',
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: categories.length,
              itemBuilder:
                  (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        print(index);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == index ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        categories[index],
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color:
                              selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
