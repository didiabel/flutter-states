import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/models/episode.dart';
import 'package:flutterstates/models/location.dart';
import 'package:flutterstates/riverpod/individual_state/riverpod_providers.dart';

class StateController extends StateNotifier<List<Location>> {
  StateController(super.state);

  void removeLocationById(int id) {
    state = state.where((location) => location.id != id).toList();
  }
}

final locationsStateProvider =
    StateNotifierProvider<StateController, List<Location>>((ref) {
  final locations = ref.watch(locationsProvider).asData?.value ?? [];
  return StateController(locations);
});

class CharactersStateController extends StateNotifier<List<Character>> {
  CharactersStateController(super.state);

  void removeCharacterById(int id) {
    state = state.where((character) => character.id != id).toList();
  }
}

final charactersStateProvider =
    StateNotifierProvider<CharactersStateController, List<Character>>((ref) {
  final characters = ref.watch(charactersProvider).asData?.value ?? [];
  return CharactersStateController(characters);
});

class EpisodesStateController extends StateNotifier<List<Episode>> {
  EpisodesStateController(super.state);

  void removeEpisodeById(int id) {
    state = state.where((episode) => episode.id != id).toList();
  }
}

final episodesStateProvider =
    StateNotifierProvider<EpisodesStateController, List<Episode>>((ref) {
  final episodes = ref.watch(episodesProvider).asData?.value ?? [];
  return EpisodesStateController(episodes);
});
