import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/apis/apis.dart';
import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/models/episode.dart';
import 'package:flutterstates/models/location.dart';

class AppState {
  final List<Location> locations;
  final List<Character> characters;
  final List<Episode> episodes;
  final bool isLocationsLoading;
  final bool isCharactersLoading;
  final bool isEpisodesLoading;

  AppState({
    required this.locations,
    required this.characters,
    required this.episodes,
    required this.isLocationsLoading,
    required this.isCharactersLoading,
    required this.isEpisodesLoading,
  });

  AppState copyWith({
    List<Location>? locations,
    List<Character>? characters,
    List<Episode>? episodes,
    bool? isLocationsLoading,
    bool? isCharactersLoading,
    bool? isEpisodesLoading,
  }) {
    return AppState(
      locations: locations ?? this.locations,
      characters: characters ?? this.characters,
      episodes: episodes ?? this.episodes,
      isLocationsLoading: isLocationsLoading ?? this.isLocationsLoading,
      isCharactersLoading: isCharactersLoading ?? this.isCharactersLoading,
      isEpisodesLoading: isEpisodesLoading ?? this.isEpisodesLoading,
    );
  }
}

class StateController extends StateNotifier<AppState> {
  StateController(super.state);

  void fetchLocations() async {
    try {
      final locations = await APIs.instance.getLocations();
      state = state.copyWith(locations: locations, isLocationsLoading: false);
      print('got  global riverpod locations');
    } catch (error) {
      log('$error');
    }
  }

  void fetchEpisodes() async {
    try {
      final episodes = await APIs.instance.getEpisodes();
      state = state.copyWith(episodes: episodes, isEpisodesLoading: false);
      print('got  global riverpod episodes');
    } catch (error) {
      log('$error');
    }
  }

  void fetchCharacters() async {
    try {
      final characters = await APIs.instance.getCharacters();
      state =
          state.copyWith(characters: characters, isCharactersLoading: false);
      print('got  global riverpod characters');
    } catch (error) {
      log('$error');
    }
  }

  Future<void> fetchData() async {
    print('fetching global riverpod data');
    fetchLocations();
    fetchCharacters();
    fetchEpisodes();
  }

  void removeLocationById(int id) {
    state = state.copyWith(
      locations:
          state.locations.where((location) => location.id != id).toList(),
    );
  }

  void removeCharacterById(int id) {
    state = state.copyWith(
      characters:
          state.characters.where((character) => character.id != id).toList(),
    );
  }

  void removeEpisodeById(int id) {
    state = state.copyWith(
      episodes: state.episodes.where((episode) => episode.id != id).toList(),
    );
  }
}

final globalRiverpodState =
    StateNotifierProvider<StateController, AppState>((ref) {
  final controller = StateController(
    AppState(
      locations: [],
      characters: [],
      episodes: [],
      isLocationsLoading: false,
      isCharactersLoading: false,
      isEpisodesLoading: false,
    ),
  );

  // Call fetchData when the provider is first initialized
  ref.onResume(() {
    controller.fetchData();
  });

  return controller;
});
