import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';

abstract class AbstractMapLocationsRepository {
  Future<List<NamedLocation>> getLocations();
}
