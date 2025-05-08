import 'package:effective_flutter_lab/presentation/map/bloc/locations_list_bloc.dart';
import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapListScreen extends StatelessWidget {
  const MapListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Row(children: [Text('Наши кофейни')]),
      ),
      body: BlocBuilder<LocationsListBloc, LocationsListState>(
        builder: (context, state) {
          if (state is LocationsListLoaded) {
            final location = state.locationsList;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 0),
              itemCount: state.locationsList.length,
              itemBuilder:
                  (context, index) => ListTile(
                    title: Text(
                      location[index].name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                    onTap: () {},
                  ),
            );
          }
          if (state is LocationsListFailure) {
            return Column(
              children: [
                Text('Что-то пошло не так'),
                ElevatedButton(
                  onPressed: () {
                    context.read<LocationsListBloc>().add(LoadLocationsList());
                  },
                  child: Text('Попробовать снова'),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
