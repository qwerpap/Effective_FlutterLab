import 'package:cached_network_image/cached_network_image.dart';
import 'package:effective_flutter_lab/data/models/product_model.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/product_counter/product_counter_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/selected_products/selected_products_list_bloc.dart';
import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:effective_flutter_lab/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_container.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.data});

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => ProductCounterBloc(data),
      child: Builder(
        builder: (context) {
          final counterBloc = context.read<ProductCounterBloc>();
          final selectedProductsListBloc =
              context.read<SelectedProductsListBloc>();

          return BlocListener<ProductCounterBloc, ProductCounterState>(
            listenWhen:
                (previous, current) => previous.counter != current.counter,
            listener: (context, state) {
              if (state.counter == 0) {
                selectedProductsListBloc.add(
                  RemoveFromCategoriesList(product: data),
                );
              }
            },
            child: Container(
              width: 180,
              height: 196,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.baseBorderRadius),
              ),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: data.imageUrl,
                    height: 100,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => Icon(
                          Icons.error,
                          size: 100,
                          color: theme.primaryColor,
                        ),
                  ),
                  SizedBox(height: AppSizes.productCardVerticalPadding),
                  Text(data.name, style: theme.textTheme.bodyLarge),
                  SizedBox(height: AppSizes.productCardVerticalPadding),
                  BlocBuilder<ProductCounterBloc, ProductCounterState>(
                    builder: (context, state) {
                      final counter = state.counter;
                      return SizedBox(
                        width: 116,
                        height: AppSizes.productCardButtonHeight,
                        child:
                            counter == 0
                                ? GestureDetector(
                                  onTap: () {
                                    counterBloc.add(IncrementCounter());
                                    selectedProductsListBloc.add(
                                      AddToCategoriesList(product: data),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${data.prices.toInt()} руб',
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                )
                                : Row(
                                  children: [
                                    BaseContainer(
                                      width: AppSizes.productCardButtonHeight,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          Icons.remove,
                                          color: AppColors.whiteColor,
                                          size: 16,
                                        ),
                                        onPressed: () {
                                          counterBloc.add(DecrementCounter());
                                          selectedProductsListBloc.add(
                                            RemoveFromCategoriesList(
                                              product: data,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppSizes.productCardHorizontalPadding,
                                    ),
                                    BaseContainer(
                                      width: 52,
                                      height: AppSizes.productCardButtonHeight,
                                      child: Center(
                                        child: Text(
                                          counter.toString(),
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          AppSizes.productCardHorizontalPadding,
                                    ),
                                    BaseContainer(
                                      width: AppSizes.productCardButtonHeight,
                                      child: Center(
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            Icons.add,
                                            color: AppColors.whiteColor,
                                            size: 16,
                                          ),
                                          onPressed: () {
                                            counterBloc.add(IncrementCounter());
                                            selectedProductsListBloc.add(
                                              AddToCategoriesList(
                                                product: data,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                      );
                    },
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
