part of 'locations_list_bloc.dart';

@immutable
sealed class LocationsListState {}

class LocationsListInitial extends LocationsListState {}

class LocationsListLoading extends LocationsListState {}

class LocationsListLoaded extends LocationsListState {
  final List<NamedLocation> locationsList;

  LocationsListLoaded({required this.locationsList});
}

class LocationsListFailure extends LocationsListState {
  final String errorText;

  LocationsListFailure({required this.errorText});
}
