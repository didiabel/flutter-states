import 'package:flutter/material.dart';
import 'package:flutterstates/models/location.dart';
import 'package:flutterstates/screens/location/location_card.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;
  final bool isLoading;

  const LocationList({
    super.key,
    required this.locations,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (locations.isEmpty) {
          return const Center(
            child: Text('No locations found'),
          );
        }

        return LocationCard(location: locations[index]);
      },
    );
  }
}
