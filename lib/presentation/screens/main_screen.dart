import 'package:effective_flutter_lab/bloc/categories/categories_list_bloc.dart';
import 'package:effective_flutter_lab/bloc/selected_products/selected_products_list_bloc.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_products_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../theme/app_strings.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final itemListener = ItemPositionsListener.create();

  bool animation = false;
  int current = 0;
  void setCurrent(int newCurrent) {
    setState(() {
      current = newCurrent;
    });
  }

  final itemController = ItemScrollController();
  void scrollToItem(int ind) async {
    animation = true;
    itemController.scrollTo(
      index: ind,
      duration: const Duration(milliseconds: 200),
    );
    await Future.delayed(const Duration(milliseconds: 200));
    animation = false;
  }

  final barItemController = ItemScrollController();
  void barScrollToItem(int ind) async {
    barItemController.scrollTo(
      index: ind,
      duration: const Duration(milliseconds: 300),
    );
  }

  bool onBottom = false;

  final _categoriesListBloc = CategoriesListBloc(
    GetIt.I<AbstractCategoriesAPI>(),
  );
  int listCategoriesLength = 0;
  @override
  void initState() {
    super.initState();

    _categoriesListBloc.add(LoadCategoriesList());

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

      if (fullVisible.length == 2) {
        if ((fullVisible[1] == listCategoriesLength - 1) && animation != true) {
          if (fullVisible[1] != current) {
            onBottom = true;
            setCurrent(fullVisible[1]);
            barScrollToItem(fullVisible[1]);
          }
        } else
          onBottom = false;
      } else
        onBottom = false;
      if (fullVisible.isNotEmpty) {
        if (((fullVisible[0] != current) && animation != true) &&
            onBottom == false) {
          setCurrent(fullVisible[0]);
          barScrollToItem(fullVisible[0]);
        }
      }
    });
  }

  final selected_productsListBloc = GetIt.I<SelectedProductsListBloc>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: Size.fromHeight((AppSizes.appBarHeight)),
          child: SizedBox(
            height: AppSizes.appBarHeight,
            child: BlocBuilder<CategoriesListBloc, CategoriesListState>(
              bloc: _categoriesListBloc,
              builder: (context, state) {
                if (state is CategoriesListLoaded) {
                  return ScrollablePositionedList.separated(
                    scrollDirection: Axis.horizontal,
                    itemScrollController: barItemController,
                    separatorBuilder:
                        (context, _) => SizedBox(
                          width: AppSizes.horizontalCategoriesPadding,
                        ),
                    itemCount: state.categoriesList.length,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap:
                              () => {
                                setCurrent(index),
                                scrollToItem(index),
                                barScrollToItem(index),
                              },
                          child: Container(
                            padding: EdgeInsets.all(AppSizes.containerPadding),
                            decoration: BoxDecoration(
                              color:
                                  current == index
                                      ? AppColors.primaryColor
                                      : Colors.white,
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
      body: BlocBuilder(
        bloc: _categoriesListBloc,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppStrings.loadingFailure),
                  TextButton(
                    onPressed: () {
                      _categoriesListBloc.add(LoadCategoriesList());
                    },
                    child: Text(AppStrings.tryAgain),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton:
          BlocBuilder<SelectedProductsListBloc, SelectedProductsListState>(
            bloc: selected_productsListBloc,
            builder: (context, state) {
              return state.products.isNotEmpty
                  ? BaseContainer(
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
                          builder: (context) => CartBottomSheet(),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(height: AppSizes.bottomCartFloatingButtonPadding),
                          Text(
                            '${state.counter.toStringAsFixed(2)} ₽',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  )
                  : SizedBox();
            },
          ),
    );
  }
}
