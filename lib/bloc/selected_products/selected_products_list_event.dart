part of 'selected_products_list_bloc.dart';

abstract class SelectedProductsListEvent {}

class ClearCategoriesList extends SelectedProductsListEvent {}

class AddToCategoriesList extends SelectedProductsListEvent {
  AddToCategoriesList({required this.product});
  final ProductModel product;
}

class RemoveFromCategoriesList extends SelectedProductsListEvent {
  RemoveFromCategoriesList({required this.product});
  final ProductModel product;
}
