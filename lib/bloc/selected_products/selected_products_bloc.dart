import 'package:flutter_bloc/flutter_bloc.dart';
part 'selected_products_event.dart';
part 'selected_products_state.dart';

class SelectedProductsBloc extends Bloc<SelectedProductsEvent, SelectedProductsState> {
  SelectedProductsBloc() : super(SelectedProductsInitial()) {
    on<SelectedProductsEvent>((event, emit) {

    });
  }
}