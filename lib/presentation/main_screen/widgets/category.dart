import 'package:effective_flutter_lab/data/models/category_model.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_products_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../theme/app_sizes.dart';
import '../bloc/products/products_list_bloc.dart';
import 'product_card.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.data});

  final CategoryModel data;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final _productsListBloc = ProductsListBloc(GetIt.I<AbstractCategoriesAPI>());

  @override
  void initState() {
    super.initState();
    _productsListBloc.add(LoadProductsList(categoryId: widget.data.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.data.slug, style: theme.textTheme.titleLarge),
        SizedBox(height: AppSizes.bottomProductsPadding),
        SizedBox(
          height: AppSizes.productCardHeight,
          child: BlocBuilder(
            bloc: _productsListBloc,
            builder: (context, state) {
              if (state is ProductsListLoaded) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder:
                      (context, _) =>
                          SizedBox(width: AppSizes.horizontalProductsPadding),
                  itemCount: state.productsList.length,
                  itemBuilder:
                      (context, index) =>
                          ProductCard(data: state.productsList[index]),
                );
              }
              return SizedBox(height: AppSizes.nullSizedBoxHeight);
            },
          ),
        ),
      ],
    );
  }
}
