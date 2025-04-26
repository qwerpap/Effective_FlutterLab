import 'package:effective_flutter_lab/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/abstract_menu_api.dart';
part 'selected_products_list_event.dart';
part 'selected_products_list_state.dart';

class SelectedProductsListBloc
    extends Bloc<SelectedProductsListEvent, SelectedProductsListState> {
  SelectedProductsListBloc(this.categoriesRepository)
    : super(SelectedProductsListState(products: [], counter: 0)) {
    on<AddToCategoriesList>(_add);
    on<ClearCategoriesList>(_clear);
    on<RemoveFromCategoriesList>(_remove);
    on<PostCategoriesList>(_post);
  }

  void _add(
    AddToCategoriesList event,
    Emitter<SelectedProductsListState> emit,
  ) {
    final newState = state.copyWith(
      products: List.of(state.products)..add(event.product),
      counter: state.counter + event.product.prices,
    );
    emit(newState);
    debugPrint(newState.toString());
  }

  void _clear(
    ClearCategoriesList event,
    Emitter<SelectedProductsListState> emit,
  ) {
    emit(SelectedProductsListState(products: [], counter: 0));
  }

  void _remove(
    RemoveFromCategoriesList event,
    Emitter<SelectedProductsListState> emit,
  ) {
    final newState = state.copyWith(
      products: List.of(state.products)..remove(event.product),
      counter: state.counter - event.product.prices,
    );
    emit(newState);
    debugPrint(newState.toString());
  }

  final AbstractMenuAPI categoriesRepository;

  Future<void> _post(
    PostCategoriesList event,
    Emitter<SelectedProductsListState> emit,
  ) async {
    final postResult = await categoriesRepository.postProductsList(
      state.products,
    );
    if (postResult) {
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 2),
          content: Text('Ваш заказ создан'),
        ),
      );
    } else {
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey,
          duration: Duration(seconds: 2),
          content: Text('Возникла ошибка при заказе'),
        ),
      );
    }
    Navigator.pop(event.context);
  }
}
