import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/sources/map_locations_api.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/sources/map_locations_db.dart';
import 'package:effective_flutter_lab/presentation/map_screen/models/named_location.dart';

class MapLocationsRepository implements AbstractMapLocationsRepository {
  MapLocationsRepository({required this.dio, required this.mapLocationsDb})
    : mapLocationsApi = MapLocationsApi(dio: dio);

  final Dio dio;
  final MapLocationsDataBase mapLocationsDb;
  final MapLocationsApi mapLocationsApi;

  @override
  Future<List<NamedLocation>> getLocations() async {
    developer.log('start getLocations', name: 'REPO');
    List<NamedLocation> locationsList = [];

    try {
      locationsList = await mapLocationsApi.getLocations();
      mapLocationsDb.saveLocations(locationsList);
    } catch (e) {
      developer.log('locations error', name: 'REPO');
      locationsList = await mapLocationsDb.getLocations();
      if (locationsList.isEmpty) throw Exception('db not found');
    }

    developer.log('locations return ', name: 'REPO');
    return locationsList;
  }
}
