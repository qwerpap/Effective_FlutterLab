import 'package:bloc/bloc.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:meta/meta.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locations_list_event.dart';
part 'locations_list_state.dart';

class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc(this.mapLocationsRepository)
    : super(LocationsListInitial()) {
    on<LoadLocationsList>(_load);
  }

  List<NamedLocation> locationsList = [];

  final AbstractMapLocationsRepository mapLocationsRepository;

  NamedLocation selectedLocation = NamedLocation(
    name: "Не выбрано",
    lat: 0,
    long: 0,
  );

  Future<void> _load(
    LoadLocationsList event,
    Emitter<LocationsListState> emit,
  ) async {
    if (state is! LocationsListLoaded) {
      try {
        emit(LocationsListLoading());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        locationsList = await mapLocationsRepository.getLocations();
        String savedLocation = prefs.getString('user location') ?? 'none';
        NamedLocation newSelectedLocation = locationsList.firstWhere(
          (element) => element.name == savedLocation,
          orElse: () => locationsList[0],
        );
        selectedLocation = newSelectedLocation;
        emit(LocationsListLoaded(locationsList: locationsList));
      } catch (e) {
        emit(LocationsListFailure(errorText: 'locations error'));
      }
    }
  }
}
