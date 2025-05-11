part of 'locations_list_bloc.dart';

@immutable
sealed class LocationsListState {}

class LocationsListInitial extends LocationsListState {}

class LocationsListLoading extends LocationsListState {}

class LocationsListLoaded extends LocationsListState {
  final List<NamedLocation> locationsList;
  final NamedLocation selectedLocation;

  LocationsListLoaded({
    required this.locationsList,
    required this.selectedLocation,
  });
}

class LocationsListFailure extends LocationsListState {
  final String errorText;

  LocationsListFailure({required this.errorText});
}
