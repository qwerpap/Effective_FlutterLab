import 'package:flutter_bloc/flutter_bloc.dart';
part 'categories_list_event.dart';
part 'categories_list_state.dart';

class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc() : super(CategoriesListInitial()) {
    on<CategoriesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
