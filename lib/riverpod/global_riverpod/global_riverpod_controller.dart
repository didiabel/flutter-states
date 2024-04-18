import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc_state.dart';
import 'package:flutterstates/apis/apis.dart';
import 'package:flutterstates/models/location.dart';

//StateNotifier
class MyStateController extends StateController<BLOCState> {
  MyStateController(super.state);

  void fetchLocations() async {
    try {
      final locations = await APIs.instance.getLocations();
      state = state.copyWith(locations: locations, loadingLocations: false);
      print('got global riverpod locations');
    } catch (error) {
      log('$error');
    }
  }

  Future<List<Location>> fetchLocations2() async {
    Future.delayed(const Duration(seconds: 3));

    return state.locations;
  }

  void fetchEpisodes() async {
    try {
      final episodes = await APIs.instance.getEpisodes();
      state = state.copyWith(episodes: episodes, loadingEpisodes: false);
      print('got global riverpod episodes');
    } catch (error) {
      log('$error');
    }
  }

  void fetchCharacters() async {
    try {
      final characters = await APIs.instance.getCharacters();
      state = state.copyWith(characters: characters, loadingCharacters: false);
      print('got global riverpod characters');
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
