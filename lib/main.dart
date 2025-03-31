import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'bloc/selected_products/selected_products_list_bloc.dart';
import 'data/repositories/abstract_products_api.dart';
import 'data/repositories/get_products_repository.dart';
import 'presentation/screens/main_screen.dart';
import 'theme/theme.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCategoriesAPI>(
    () => GetProductsRepository(dio: Dio()),
  );
  GetIt.I.registerLazySingleton<SelectedProductsListBloc>(
    () => SelectedProductsListBloc(GetIt.I<AbstractCategoriesAPI>()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
