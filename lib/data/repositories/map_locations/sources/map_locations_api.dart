import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';

class MapLocationsApi implements AbstractMapLocationsRepository {
  MapLocationsApi({required this.dio});
  final Dio dio;

  @override
  Future<List<NamedLocation>> getLocations() async {
    List<NamedLocation> locationsList = [];
    try {
      final Response<dynamic> response = await dio.get(
        'https://coffeeshop.academy.effective.band/api/v1/locations',
      );
      final data = response.data;
      locationsList = List<NamedLocation>.from(
        (data['data'] as List<dynamic>).map(
          (value) => NamedLocation(
            name: value['address'],
            lat: double.parse(value['lat'].toString()),
            long: double.parse(value['lng'].toString()),
          ),
        ),
      );
      developer.log('return locations', name: 'API');
      return locationsList;
    } catch (e) {
      developer.log('locations error', name: 'API');
      rethrow;
    }
  }
}
