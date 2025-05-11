import 'dart:async';

import 'package:effective_flutter_lab/presentation/map_screen/bloc/locations_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/map_screen/models/latlong_location.dart';
import 'package:effective_flutter_lab/presentation/map_screen/models/named_location.dart';
import 'package:effective_flutter_lab/presentation/map_screen/view/map_list_screen.dart';
import 'package:effective_flutter_lab/presentation/map_screen/widgets/app_map_object.dart';
import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();

  static BoxDecoration boxDecoration = BoxDecoration(
    color: AppColors.whiteColor,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(color: Colors.black45, blurRadius: 1, offset: Offset(1, 1)),
    ],
  );

  Future<void> _moveToCurrentLocation(LatlongLocation appLatLong) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
          zoom: 16,
        ),
      ),
    );
  }

  List<PlacemarkMapObject> _getPlacemarkObjects(
    BuildContext context,
    List<NamedLocation> locations,
  ) {
    List<PlacemarkMapObject> mapPoints =
        locations
            .map(
              (point) =>
                  AppMapObject(
                    point: point,
                    context: context,
                  ).getPlacemarkObject(),
            )
            .toList();
    return mapPoints;
  }

  @override
  void initState() {
    super.initState();
    context.read<LocationsListBloc>().add(
      GetPermission(move: _moveToCurrentLocation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationsListBloc, LocationsListState>(
        builder: (context, state) {
          return YandexMap(
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
            mapObjects:
                state is LocationsListLoaded
                    ? _getPlacemarkObjects(context, state.locationsList)
                    : [],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: boxDecoration,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
              ),
            ),
            Container(
              height: 48,
              width: 48,
              decoration: boxDecoration,
              child: IconButton(
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapListScreen()),
                    ),
                icon: Icon(Icons.map, color: AppColors.blackColor),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
