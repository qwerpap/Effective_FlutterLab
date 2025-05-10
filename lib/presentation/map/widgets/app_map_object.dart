import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';
import 'package:effective_flutter_lab/presentation/map/widgets/modal_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AppMapObject {
  final NamedLocation point;
  final BuildContext context;

  AppMapObject({required this.point, required this.context});

  PlacemarkMapObject getPlacemarkObject() {
    return PlacemarkMapObject(
      mapId: MapObjectId('MapObject ${point.name}'),
      point: Point(latitude: point.lat, longitude: point.long),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/png/coffe_image.png'),
          scale: 2,
        ),
      ),
      onTap:
          (_, __) => showModalBottomSheet(
            context: context,
            builder: (context) => ModalSheetView(point: point),
          ),
    );
  }
}
