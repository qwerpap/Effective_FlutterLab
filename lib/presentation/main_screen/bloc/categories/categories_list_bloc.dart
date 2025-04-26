import 'dart:async';
import 'package:effective_flutter_lab/data/models/category_model.dart';
import 'package:effective_flutter_lab/data/repositories/abstract_menu_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc(this.categoriesRepository)
    : super(CategoriesListInitial()) {
    on<LoadCategoriesList>(_load);
  }

  final AbstractMenuAPI categoriesRepository;

  Future<void> _load(
    LoadCategoriesList event,
    Emitter<CategoriesListState> emit,
  ) async {
    try {
      if (state is! CategoriesListLoaded) {
        emit(CategoriesListLoading());
      }
      final categoriesList = await categoriesRepository.getCategoriesList();
      emit(CategoriesListLoaded(categoriesList: categoriesList));
    } catch (e) {
      emit(CategoriesListLoadingFailure('лист с категориями не найден'));
    } finally {
      event.completer?.complete();
    }
  }
}
