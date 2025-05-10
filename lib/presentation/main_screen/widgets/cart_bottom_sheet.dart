import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:effective_flutter_lab/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/app_strings.dart';
import '../bloc/selected_products/selected_products_list_bloc.dart';
import 'selected_product.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<SelectedProductsListBloc, SelectedProductsListState>(
      listener: (context, state) {
        if (state.products.isEmpty) {
          Navigator.pop(context);
        }
      },
      child: DraggableScrollableSheet(
        initialChildSize: AppSizes.initialChildSize,
        builder:
            (_, controller) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.baseHorizontalPadding,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.cartOrder,
                        style: theme.textTheme.titleLarge,
                      ),
                      BlocBuilder<
                        SelectedProductsListBloc,
                        SelectedProductsListState
                      >(
                        builder: (context, state) {
                          return IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              context.read<SelectedProductsListBloc>().add(
                                ClearCategoriesList(),
                              );
                            },
                            icon: Icon(
                              Icons.remove_shopping_cart_rounded,
                              color: AppColors.redColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.bottomCartPadding),
                  const Divider(),
                  SizedBox(height: AppSizes.bottomCartPadding),
                  Expanded(
                    child: BlocBuilder<
                      SelectedProductsListBloc,
                      SelectedProductsListState
                    >(
                      builder: (context, state) {
                        return state.products.isNotEmpty
                            ? ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder:
                                  (context, index) => SelectedProduct(
                                    data: state.products[index],
                                  ),
                            )
                            : const SizedBox();
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.postButtonHeight,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<SelectedProductsListBloc>().add(
                          PostCategoriesList(context: context),
                        );
                      },
                      child: Text(
                        AppStrings.placeOrder,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
      ),
    );
  }
}
