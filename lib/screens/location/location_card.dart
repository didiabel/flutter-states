import 'package:flutter/material.dart';
import 'package:flutterstates/models/location.dart'; // Import your Character model here

class LocationCard extends StatelessWidget {
  final Location location;
  final Function(int locationId) onDeleteLocation;

  const LocationCard({
    super.key,
    required this.location,
    required this.onDeleteLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    location.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () => onDeleteLocation(location.id),
                    icon: const Icon(Icons.delete)),
              ],
            ),
            Text(
              location.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Type: ${location.type}'),
            Text('Dimension: ${location.dimension}'),
            const SizedBox(height: 16),
            const Text('Residents:'),
            const SizedBox(height: 16),
            Text('URL: ${location.url}'),
            Text('Created: ${location.created}'),
          ],
        ),
      ),
    );
  }
}
