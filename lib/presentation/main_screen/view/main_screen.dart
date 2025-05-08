import 'package:effective_flutter_lab/presentation/main_screen/bloc/categories/categories_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/selected_products/selected_products_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/widgets/widgets.dart';
import 'package:effective_flutter_lab/presentation/map/view/map_screen.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:effective_flutter_lab/theme/app_sizes.dart';
import 'package:effective_flutter_lab/theme/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final itemListener = ItemPositionsListener.create();
  bool animation = false;
  int current = 0;
  bool onBottom = false;
  int listCategoriesLength = 0;
  final itemController = ItemScrollController();
  final barItemController = ItemScrollController();

  void setCurrent(int newCurrent) {
    setState(() {
      current = newCurrent;
    });
  }

  void scrollToItem(int ind) async {
    animation = true;
    itemController.scrollTo(
      index: ind,
      duration: const Duration(milliseconds: 200),
    );
    await Future.delayed(const Duration(milliseconds: 200));
    animation = false;
  }

  void barScrollToItem(int ind) async {
    barItemController.scrollTo(
      index: ind,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void initState() {
    super.initState();

    itemListener.itemPositions.addListener(() {
      final fullVisible =
          itemListener.itemPositions.value
              .where((item) {
                final isTopVisible = item.itemLeadingEdge >= 0;
                final isBottomVisible = item.itemTrailingEdge < 1;
                return isTopVisible && isBottomVisible;
              })
              .map((item) => item.index)
              .toList();

      if (fullVisible.isNotEmpty) {
        final newCurrent = fullVisible[0];
        if (newCurrent != current && !animation) {
          setCurrent(newCurrent);
          barScrollToItem(newCurrent);
        }
        if (fullVisible.length == 2 &&
            fullVisible[1] == listCategoriesLength - 1 &&
            !animation) {
          setCurrent(fullVisible[1]);
          barScrollToItem(fullVisible[1]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoriesListBloc = context.read<CategoriesListBloc>();
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen()),
              ),
          child: Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5),
              Text('name street'),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppSizes.appBarHeight),
          child: SizedBox(
            height: AppSizes.appBarHeight,
            child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
              builder: (context, state) {
                if (state is CategoriesListLoaded) {
                  return ScrollablePositionedList.separated(
                    scrollDirection: Axis.horizontal,
                    itemScrollController: barItemController,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder:
                        (context, _) => SizedBox(
                          width: AppSizes.horizontalCategoriesPadding,
                        ),
                    itemCount: state.categoriesList.length,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            setCurrent(index);
                            scrollToItem(index);
                            barScrollToItem(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(AppSizes.containerPadding),
                            decoration: BoxDecoration(
                              color:
                                  current == index
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(
                                AppSizes.baseBorderRadius,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              state.categoriesList[index].slug,
                              style:
                                  current == index
                                      ? theme.textTheme.bodyMedium?.copyWith(
                                        color: AppColors.whiteColor,
                                      )
                                      : theme.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
      body: BlocBuilder<CategoriesListBloc, CategoriesListState>(
        builder: (context, state) {
          if (state is CategoriesListLoaded) {
            listCategoriesLength = state.categoriesList.length;
            return ScrollablePositionedList.separated(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalProductsPadding,
              ),
              itemScrollController: itemController,
              itemCount: state.categoriesList.length,
              itemPositionsListener: itemListener,
              separatorBuilder:
                  (context, _) =>
                      SizedBox(height: AppSizes.bottomProductsPadding),
              itemBuilder:
                  (context, index) =>
                      Category(data: state.categoriesList[index]),
            );
          }
          if (state is CategoriesListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.loadingFailure),
                  TextButton(
                    onPressed: () {
                      categoriesListBloc.add(LoadCategoriesList());
                    },
                    child: const Text(AppStrings.tryAgain),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton:
          BlocBuilder<SelectedProductsListBloc, SelectedProductsListState>(
            builder: (context, state) {
              if (state.products.isEmpty) {
                return const SizedBox();
              }
              return BaseContainer(
                height: 65,
                width: 100,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      elevation: 0,
                      backgroundColor: AppColors.whiteColor,
                      showDragHandle: true,
                      builder: (context) => const CartBottomSheet(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: AppColors.whiteColor,
                      ),
                      SizedBox(width: AppSizes.bottomCartFloatingButtonPadding),
                      Text(
                        '${state.counter.toStringAsFixed(2)} ₽',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
