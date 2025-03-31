import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../bloc/selected_products/selected_products_list_bloc.dart';
import '../../data/models/product_model.dart';
import 'base_container.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.data});

  final ProductModel data;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final _selected_productsListBloc = GetIt.I<SelectedProductsListBloc>();

  int _counter = 0;

  // void _addToCart() {
  //   setState(() {
  //     _current = 1;
  //   });
  // }

  void _increment() {
    if (_counter < 10) {
      setState(() {
        _selected_productsListBloc.add(
          AddToCategoriesList(product: widget.data),
        );
        _counter++;
      });
    }
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _selected_productsListBloc.add(
          RemoveFromCategoriesList(product: widget.data),
        );
        _counter--;
      });
    }
  }

  void _setCounterZero() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocListener<SelectedProductsListBloc, SelectedProductsListState>(
      bloc: _selected_productsListBloc,
      listener: (context, state) {
        setState(() {
          if ((state.counter == 0) && _counter != 0) _setCounterZero();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Image.network(
              widget.data.imageUrl,
              height: 100,
              fit: BoxFit.contain,
              errorBuilder:
                  (context, error, stackTrace) =>
                      Icon(Icons.error, size: 100, color: theme.primaryColor),
            ),
            SizedBox(height: 8),
            Text(widget.data.name, style: theme.textTheme.bodyLarge),
            SizedBox(height: 8),
            SizedBox(
              width: 116,
              height: 24,
              child:
                  _counter == 0
                      ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextButton(
                          onPressed: (_increment),
                          child: Text(
                            widget.data.prices.toString(),
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      )
                      : Row(
                        children: [
                          BaseContainer(
                            width: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 16,
                              ),
                              onPressed: _decrement,
                            ),
                          ),
                          SizedBox(width: 8),
                          BaseContainer(
                            width: 52,
                            height: 24,
                            child: Center(
                              child: Text(
                                _counter.toString(),
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          BaseContainer(
                            width: 24,
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                onPressed: _increment,
                              ),
                            ),
                          ),
                        ],
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
