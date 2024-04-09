import 'package:flutterstates/apis/apis.dart';
import 'package:flutterstates/riverpod/riverpod_notifier/riverpod_state.dart';
import 'package:riverpod/riverpod.dart';

/// An object that controls [RiverpodState].
class RiverpodNotifier extends Notifier<RiverpodState> {
  final APIs api = APIs.instance;
  @override
  RiverpodState build() {
    loadInitialData();
    return const RiverpodState(
      loadingCharacters: true,
      loadingEpisodes: true,
      loadingLocations: true,
    );
  }

  void loadInitialData() async {
    final episodes = await api.getEpisodes();
    final characters = await api.getCharacters();
    final locations = await api.getLocations();

    state = state.copyWith(
      episodes: episodes,
      characters: characters,
      locations: locations,
      loadingEpisodes: false,
      loadingCharacters: false,
      loadingLocations: false,
    );
  }

  void removeCharacter(int characterId) {
    state = state.copyWith(
      characters: state.characters
          .where((character) => character.id != characterId)
          .toList(),
    );
  }

  void removeEpisode(int episodeId) {
    state = state.copyWith(
      episodes:
          state.episodes.where((episode) => episode.id != episodeId).toList(),
    );
  }

  void removeLocation(int locationId) {
    state = state.copyWith(
      locations: state.locations
          .where((location) => location.id != locationId)
          .toList(),
    );
  }
}
