import 'package:flutter/material.dart';
import 'package:flutterstates/models/episode.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;

  const EpisodeCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Episode ${episode.episode} - ${episode.name}',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text(
              'Air Date: ${episode.airDate}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            // const SizedBox(height: 8),
            // Text(
            //   'Characters: ${episode.characters.join(', ')}',
            //   style: Theme.of(context).textTheme.subtitle2,
            // ),
            const SizedBox(height: 8),
            Text(
              'Created: ${episode.created.toIso8601String()}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: () =>
            //       launchUrl(Uri.parse(episode.url), context: context),
            //   child: const Text('View More'),
            // ),
          ],
        ),
      ),
    );
  }
}
