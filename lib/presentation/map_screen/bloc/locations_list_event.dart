part of 'locations_list_bloc.dart';

@immutable
sealed class LocationsListEvent {}

class LoadLocationsList extends LocationsListEvent {}

class SelectLocation extends LocationsListEvent {
  final NamedLocation location;

  SelectLocation({required this.location});
}

class GetPermission extends LocationsListEvent {
  final Future<void> Function(Coords) move;

  GetPermission({required this.move});
}
