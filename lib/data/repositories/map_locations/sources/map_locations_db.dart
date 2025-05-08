import 'dart:developer' as developer;

import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/presentation/map/database/locations_database.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';

class MapLocationsDataBase implements AbstractMapLocationsRepository {
  final LocationsDatabase LocationsDB = LocationsDatabase();

  @override
  Future<List<NamedLocation>> getLocations() async {
    developer.log('start getLocations', name: 'DB');
    List<LocationsItem> dbCategories =
        await LocationsDB.select(LocationsDB.locationsItems).get();
    List<NamedLocation> locationsList =
        dbCategories.map((loc) {
          return NamedLocation(name: loc.address, lat: loc.lat, long: loc.long);
        }).toList();
    developer.log('return', name: 'DB');
    return locationsList;
  }

  void saveLocations(List<NamedLocation> locationsToSave) async {
    developer.log('start saveLocations', name: 'DB');

    await LocationsDB.delete(LocationsDB.locationsItems).go();

    for (final loc in locationsToSave) {
      developer.log('saving Location', name: 'DB');
      await LocationsDB.into(LocationsDB.locationsItems).insert(
        LocationsItemsCompanion.insert(
          address: loc.name,
          lat: loc.lat,
          long: loc.long,
        ),
      );
      developer.log('Location saved', name: 'DB');
    }
    developer.log('saveLocations complete', name: 'DB');
  }
}
