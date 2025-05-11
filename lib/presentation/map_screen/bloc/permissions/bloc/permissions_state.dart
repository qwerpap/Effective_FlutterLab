part of 'permissions_bloc.dart';

@immutable
sealed class PermissionsState {}

class PermissionsInitial extends PermissionsState {}

class PermissionsGranted extends PermissionsState {
  final Coords userLocation;

  PermissionsGranted({required this.userLocation});
}

class PermissionsDenied extends PermissionsState {}

class PermissionsError extends PermissionsState {
  final String textError;

  PermissionsError({required this.textError});
}
