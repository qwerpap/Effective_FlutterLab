part of 'locations_list_bloc.dart';

@immutable
sealed class LocationsListEvent {}

class LoadLocationsList extends LocationsListEvent {}