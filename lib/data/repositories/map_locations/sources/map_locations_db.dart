import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/presentation/map/database/locations_database.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';

class MapLocationsDataBase implements AbstractMapLocationsRepository {
  final LocationsDatabase LocationsDB = LocationsDatabase();

  @override
  Future<List<NamedLocation>> getLocations() async {
    List<LocationsItem> dbCategories =
        await LocationsDB.select(LocationsDB.locationsItems).get();
    List<NamedLocation> locationsList =
        dbCategories.map((loc) {
          return NamedLocation(name: loc.address, lat: loc.lat, long: loc.long);
        }).toList();
    return locationsList;
  }

  void saveLocations(List<NamedLocation> locationsToSave) async {
    await LocationsDB.delete(LocationsDB.locationsItems).go();

    for (final loc in locationsToSave) {
      await LocationsDB.into(LocationsDB.locationsItems).insert(
        LocationsItemsCompanion.insert(
          address: loc.name,
          lat: loc.lat,
          long: loc.long,
        ),
      );
    }
  }
}
