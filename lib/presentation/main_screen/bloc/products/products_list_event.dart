part of 'products_list_bloc.dart';

abstract class ProductsListEvent {}

class LoadProductsList extends ProductsListEvent {
  LoadProductsList({required this.categoryId, this.completer});

  final int categoryId;
  final Completer? completer;
}
