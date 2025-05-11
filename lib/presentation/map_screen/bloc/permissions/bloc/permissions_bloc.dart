import 'package:bloc/bloc.dart';
import 'package:effective_flutter_lab/presentation/map_screen/models/coords.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  final Location _location = Location();

  PermissionsBloc() : super(PermissionsInitial()) {
    on<RequestLocationPermission>(_mapRequestLocationPermissionToState);
  }

  Future<void> _mapRequestLocationPermissionToState(
    RequestLocationPermission event,
    Emitter<PermissionsState> emit,
  ) async {
    try {
      bool hasPermission = await _checkPermission();

      if (hasPermission) {
        LocationData locationData = await _location.getLocation();
        Coords userLocation = Coords(
          lat: locationData.latitude ?? 0,
          long: locationData.longitude ?? 0,
        );
        await event.move(userLocation);
        emit(PermissionsGranted(userLocation: userLocation));
      } else {
        emit(PermissionsDenied());
      }
    } catch (e) {
      emit(PermissionsError(textError: e.toString()));
    }
  }

  Future<bool> _checkPermission() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return false;
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }
}
