import 'package:flutter/material.dart';
import 'package:flutterstates/models/episode.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  final Function(int episodeId) onDeleteEpisode;

  const EpisodeCard({
    super.key,
    required this.episode,
    required this.onDeleteEpisode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Episode ${episode.episode} - ${episode.name}',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                IconButton(
                    onPressed: () => onDeleteEpisode(episode.id),
                    icon: const Icon(Icons.delete)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Air Date: ${episode.airDate}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 8),
            Text(
              'Created: ${episode.created.toIso8601String()}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
