import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/map_locations_repository.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Location _location = Location();
  late YandexMapController _mapController;
  List<MapObject> _mapObjects = [];

  @override
  void initState() {
    super.initState();
    // Инициализация после создания карты
  }

  Future<void> _initializeLocation() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    final locationData = await _location.getLocation();

    final point = Point(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );

    _mapController.moveCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: point, zoom: 16)),
    );

    final placemark = PlacemarkMapObject(
      mapId: const MapObjectId('my_location'),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/png/coffe_image.png'),
          scale: 1.5,
        ),
      ),
    );

    setState(() {
      _mapObjects = [placemark];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: MapLocationsRepository(dio: Dio()).getLocations,
      ),
      body: YandexMap(
        onMapCreated: (controller) {
          _mapController = controller;
          _initializeLocation();
        },
        mapObjects: _mapObjects,
      ),
    );
  }
}
