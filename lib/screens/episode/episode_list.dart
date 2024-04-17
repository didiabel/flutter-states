import 'package:flutter/material.dart';
import 'package:flutterstates/models/episode.dart';
import 'package:flutterstates/screens/episode/episode_card.dart';

class EpisodeList extends StatelessWidget {
  final List<Episode> episodes;
  final bool isLoading;
  final Function(int episodeId) onDeleteEpisode;

  const EpisodeList({
    super.key,
    required this.episodes,
    this.isLoading = false,
    required this.onDeleteEpisode,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        if (episodes.isEmpty) {
          return const Center(
            child: Text('No episodes found'),
          );
        }

        return EpisodeCard(
          episode: episodes[index],
          onDeleteEpisode: onDeleteEpisode,
        );
      },
    );
  }
}
