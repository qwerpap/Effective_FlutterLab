import 'package:dio/dio.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/abstract_map_locations_repository.dart';
import 'package:effective_flutter_lab/data/repositories/map_locations/map_locations_repository.dart';
import 'package:effective_flutter_lab/data/repositories/menu_categories/abstract_menu_api.dart';
import 'package:effective_flutter_lab/presentation/main_screen/database/categories_database.dart';
import 'package:effective_flutter_lab/presentation/main_screen/database/products_database.dart';
import 'package:effective_flutter_lab/data/repositories/menu_categories/get_products_repository.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/categories/categories_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/bloc/selected_products/selected_products_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/main_screen/view/main_screen.dart';
import 'package:effective_flutter_lab/presentation/map/bloc/locations_list_bloc.dart';
import 'package:effective_flutter_lab/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractMenuAPI>(
    () => GetProductsRepository(dio: Dio()),
  );
  GetIt.I.registerLazySingleton<AbstractMapLocationsRepository>(
    () => MapLocationsRepository(dio: Dio()),
  );
  GetIt.I.registerLazySingleton<CategoriesDatabase>(() => CategoriesDatabase());
  GetIt.I.registerLazySingleton<ProductsDatabase>(() => ProductsDatabase());

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
      ],
      child: MaterialApp(
        theme: themeData,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
