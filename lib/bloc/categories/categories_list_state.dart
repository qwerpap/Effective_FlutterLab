part of 'categories_list_bloc.dart';

class CategoriesListState {}

class CategoriesListInitial extends CategoriesListState {}

class CategoriesListLoading extends CategoriesListState {}

class CategoriesListLoaded extends CategoriesListState {
  CategoriesListLoaded({required this.productsList});

  final List<CategoryModel> productsList;
}

class CategoriesListLoadingFailure extends CategoriesListState {}
