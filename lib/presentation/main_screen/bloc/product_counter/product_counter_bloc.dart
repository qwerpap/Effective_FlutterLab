import 'package:effective_flutter_lab/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_counter_event.dart';
part 'product_counter_state.dart';

class ProductCounterBloc
    extends Bloc<ProductCounterEvent, ProductCounterState> {
  ProductCounterBloc(this.product) : super(ProductCounterState(counter: 0)) {
    on<IncrementCounter>((event, emit) {
      if (state.counter < 10) {
        emit(ProductCounterState(counter: state.counter + 1));
      }
    });

    on<DecrementCounter>((event, emit) {
      if (state.counter > 0) {
        emit(ProductCounterState(counter: state.counter - 1));
      }
    });

    on<ResetCounter>((event, emit) {
      emit(ProductCounterState(counter: 0));
    });
  }

  final ProductModel product;
}
