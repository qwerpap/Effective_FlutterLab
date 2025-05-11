import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/presentation/map_screen/database/locations_database.dart';
import 'package:effective_flutter_lab/presentation/map_screen/models/coords.dart';
import 'package:effective_flutter_lab/presentation/map_screen/models/named_location.dart';

class MapLocationsDataBase implements AbstractMapLocationsRepository {
  final LocationsDatabase locationsDB;

  MapLocationsDataBase({required this.locationsDB});

  @override
  Future<List<NamedLocation>> getLocations() async {
    List<LocationsItem> dbCategories =
        await locationsDB.select(locationsDB.locationsItems).get();
    List<NamedLocation> locationsList =
        dbCategories.map((loc) {
          return NamedLocation(
            name: loc.address,
            coords: Coords(lat: loc.lat, long: loc.long),
          );
        }).toList();
    return locationsList;
  }

  void saveLocations(List<NamedLocation> locationsToSave) async {
    await locationsDB.delete(locationsDB.locationsItems).go();

    for (final loc in locationsToSave) {
      await locationsDB
          .into(locationsDB.locationsItems)
          .insert(
            LocationsItemsCompanion.insert(
              address: loc.name,
              lat: loc.coords.lat,
              long: loc.coords.long,
            ),
          );
    }
  }
}
