part of 'permissions_bloc.dart';

@immutable
sealed class PermissionsEvent {}

class RequestLocationPermission extends PermissionsEvent {
  final Future<void> Function(Coords) move;

  RequestLocationPermission({required this.move});
}
