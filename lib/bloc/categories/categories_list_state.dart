part of 'categories_list_bloc.dart';

class CategoriesListState {}

class CategoriesListInitial extends CategoriesListState {}

class CategoriesListLoading extends CategoriesListState {}

class CategoriesListLoaded extends CategoriesListState {
  CategoriesListLoaded({required this.categoriesList});

  final List<CategoryModel> categoriesList;
}

class CategoriesListLoadingFailure extends CategoriesListState {
  CategoriesListLoadingFailure(this.textError);
  final String textError;
}
