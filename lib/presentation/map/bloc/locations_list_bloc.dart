import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';
part 'locations_list_event.dart';
part 'locations_list_state.dart';

class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc() : super(LocationsListInitial()) {
    on<LoadLocationsList>(_load);
  }

  List<NamedLocation> locationsList = [];

  Future<void> _load(
    LoadLocationsList event,
    Emitter<LocationsListState> emit,
  ) async {
    if (state is! LocationsListLoaded) {
      try {
        emit(LocationsListLoading());
      } catch (e) {}
    }
  }
}
