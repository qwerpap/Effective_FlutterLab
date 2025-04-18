import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/product_model.dart';
import '../../../../data/repositories/abstract_products_api.dart';
part 'products_list_event.dart';
part 'products_list_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsListBloc(this.categoriesRepository) : super(ProductsListInitial()) {
    on<LoadProductsList>(_load);
  }

  final AbstractCategoriesAPI categoriesRepository;

  Future<void> _load(
    LoadProductsList event,
    Emitter<ProductsListState> emit,
  ) async {
    try {
      if (state is! ProductsListLoaded) {
        emit(ProductsListLoading());
      }
      final productsList = await categoriesRepository.getProductsByCategoryList(
        event.categoryId,
      );
      emit(ProductsListLoaded(productsList: productsList));
    } catch (e) {
      emit(ProductsListLoadingFailure(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
