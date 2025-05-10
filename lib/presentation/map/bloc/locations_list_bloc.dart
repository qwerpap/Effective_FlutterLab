import 'package:bloc/bloc.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/presentation/map/models/latlong_location.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locations_list_event.dart';
part 'locations_list_state.dart';

class LocationsListBloc extends Bloc<LocationsListEvent, LocationsListState> {
  LocationsListBloc(this.mapLocationsRepository)
    : super(LocationsListInitial()) {
    on<LoadLocationsList>(_load);
    on<SelectLocation>(_location);
    on<GetPermission>(_getPermissions);
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
        emit(
          LocationsListLoaded(
            locationsList: locationsList,
            selectedLocation: selectedLocation,
          ),
        );
      } catch (e) {
        emit(LocationsListFailure(errorText: 'locations error'));
      }
    }
  }

  Future<void> _location(
    SelectLocation event,
    Emitter<LocationsListState> emit,
  ) async {
    if (state is LocationsListLoaded) {
      emit(LocationsListLoading());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user location', event.location.name);
      selectedLocation = event.location;
      emit(
        LocationsListLoaded(
          locationsList: locationsList,
          selectedLocation: selectedLocation,
        ),
      );
    }
  }

  bool havePermission = false;

  Future<void> _getPermissions(
    GetPermission event,
    Emitter<LocationsListState> emit,
  ) async {
    if (state is LocationsListLoaded) {
      havePermission = await _checkPermission();

      LatlongLocation userLocation;
      if (havePermission) {
        LocationData locationData;
        locationData = await location.getLocation();
        userLocation = LatlongLocation(
          lat: locationData.latitude ?? 0,
          long: locationData.longitude ?? 0,
        );
      } else {
        userLocation = LatlongLocation(
          lat: selectedLocation.lat,
          long: selectedLocation.long,
        );
      }
      await event.move(userLocation);
    }
  }

  final Location location = Location();
  Future<bool> _checkPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}
