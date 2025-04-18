import 'package:effective_flutter_lab/bloc/selected_products/selected_products_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/widgets/widgets.dart';
import 'package:effective_flutter_lab/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../theme/app_strings.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({super.key});

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  final _selected_productsListBloc = GetIt.I<SelectedProductsListBloc>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
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
                    SizedBox(
                      height: AppSizes.trashIconSize,
                      width: AppSizes.trashIconSize,
                      child: IconButton(
                        onPressed: () {
                          _selected_productsListBloc.add(ClearCategoriesList());
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.remove_shopping_cart_rounded,
                          color: Colors.red,
                        ),
                      ),
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
                    bloc: _selected_productsListBloc,
                    builder: (context, state) {
                      return state.products.isNotEmpty
                          ? ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder:
                                (context, index) => SelectedProduct(
                                  data: state.products[index],
                                ),
                          )
                          : SizedBox();
                    },
                  ),
                ),
                SizedBox(
                  height: AppSizes.postButtonHeight,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _selected_productsListBloc.add(
                        PostCategoriesList(context: context),
                      );
                    },
                    child: Text(
                      AppStrings.placeOrder,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
