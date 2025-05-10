import 'package:effective_flutter_lab/presentation/map/bloc/locations_list_bloc.dart';
import 'package:effective_flutter_lab/presentation/map/models/named_location.dart';
import 'package:effective_flutter_lab/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalSheetView extends StatefulWidget {
  const ModalSheetView({super.key, required this.point});

  final NamedLocation point;

  @override
  State<ModalSheetView> createState() => _ModalSheetViewState();
}

class _ModalSheetViewState extends State<ModalSheetView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.point.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  context.read<LocationsListBloc>().add(
                    SelectLocation(location: widget.point),
                  );
                },
                child: Text(
                  'Выбрать',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
