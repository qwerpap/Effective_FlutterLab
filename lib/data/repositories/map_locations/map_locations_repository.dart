import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/sources/map_locations_api.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/sources/map_locations_db.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';

class MapLocationsRepository implements AbstractMapLocationsRepository {
  MapLocationsRepository({required this.dio}) {
    MapLocations_API = MapLocationsApi(dio: dio);
  }

  final Dio dio;

  late MapLocationsApi MapLocations_API;

  final MapLocations_DB = MapLocationsDataBase();

  @override
  Future<List<NamedLocation>> getLocations() async {
    developer.log('start getLocations', name: 'REPO');
    List<NamedLocation> locationsList = [];
    try {
      locationsList = await MapLocations_API.getLocations();
      MapLocations_DB.saveLocations(locationsList);
    } catch (e) {
      developer.log('locations error', name: 'REPO');
      locationsList = await MapLocations_DB.getLocations();
      if (locationsList.isEmpty) return throw Exception('db not found');
    }
    developer.log('locations return ', name: 'REPO');
    return locationsList;
  }
}
