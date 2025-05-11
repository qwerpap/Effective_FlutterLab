import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/map_locations_repository.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/sources/map_locations_db.dart';
import 'package:effective_flutter_lab/data/repositories/menu_categories/abstract_menu_api.dart';
import 'package:effective_flutter_lab/presentation/main_screen/database/products_database.dart';
import 'package:effective_flutter_lab/data/repositories/menu_categories/get_products_repository.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/categories/categories_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/selected_products/selected_products_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/view/main_screen.dart';
import 'package:effective_flutter_lab/presentation/map_screen/bloc/locations/locations_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/map_screen/bloc/permissions/bloc/permissions_bloc.dart';
import 'package:effective_flutter_lab/presentation/map_screen/database/locations_database.dart';
import 'package:effective_flutter_lab/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractMenuAPI>(
    () => GetProductsRepository(dio: Dio()),
  );
  GetIt.I.registerLazySingleton<ProductsDatabase>(() => ProductsDatabase());

  GetIt.I.registerLazySingleton<LocationsDatabase>(() => LocationsDatabase());
  GetIt.I.registerLazySingleton<MapLocationsDataBase>(
    () => MapLocationsDataBase(locationsDB: GetIt.I<LocationsDatabase>()),
  );

  GetIt.I.registerLazySingleton<AbstractMapLocationsRepository>(
    () => MapLocationsRepository(
      dio: Dio(),
      mapLocationsDb: GetIt.I<MapLocationsDataBase>(),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesListBloc>(
          create:
              (context) =>
                  CategoriesListBloc(GetIt.I<AbstractMenuAPI>())
                    ..add(LoadCategoriesList()),
        ),
        BlocProvider<SelectedProductsListBloc>(
          create:
              (context) => SelectedProductsListBloc(GetIt.I<AbstractMenuAPI>()),
        ),
        BlocProvider<LocationsListBloc>(
          create:
              (context) =>
                  LocationsListBloc(GetIt.I<AbstractMapLocationsRepository>())
                    ..add(LoadLocationsList()),
        ),
        BlocProvider<PermissionsBloc>(create: (context) => PermissionsBloc()),
      ],
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
