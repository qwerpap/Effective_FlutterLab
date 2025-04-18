part of 'selected_products_list_bloc.dart';

class SelectedProductsListState {
  final List<ProductModel> products; 
  final num counter; 

  SelectedProductsListState({
    required this.products,
    required this.counter,
  });

  SelectedProductsListState copyWith({
    List<ProductModel>? products,
    num? counter,
  }) {
    return SelectedProductsListState(
      products: products ?? this.products,
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() {
    return 'SelectedProductsListState{products: $products, counter: $counter}';
  }
}