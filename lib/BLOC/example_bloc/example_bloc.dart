import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc_event.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc_state.dart';
import 'package:flutterstates/apis/apis.dart';

class BLOC extends Bloc<BLOCEvent, BLOCState> {
  final APIs api = APIs.instance;
  // aca se emite el primer estado
  BLOC() : super(BLOCState()) {
    on<InitializeBLOCEvent>((event, emit) async {
      add(const LoadLocationsEvent());
      add(const LoadEpisodesEvent());
      add(const LoadCharactersEvent());
    });

//
    on<LoadLocationsEvent>((event, emit) async {
      emit(state.copyWith(locations: [], loadingLocations: true));

      try {
        final locations = await api.getLocations();
        emit(state.copyWith(locations: locations, loadingLocations: false));
      } catch (e) {
        emit(state.copyWith(loadingLocations: false));
      }
    });

    on<LoadEpisodesEvent>((event, emit) async {
      emit(state.copyWith(episodes: [], loadingEpisodes: true));

      final episodes = await api.getEpisodes();

      emit(state.copyWith(episodes: episodes, loadingEpisodes: false));
    });

    on<LoadCharactersEvent>((event, emit) async {
      emit(state.copyWith(characters: [], loadingCharacters: true));

      final characters = await api.getCharacters();

      emit(state.copyWith(characters: characters, loadingCharacters: false));
    });

    on<RemoveLocationEvent>((event, emit) async {
      final newLocations =
          state.locations.where((location) => location.id != event.id).toList();
      emit(state.copyWith(locations: newLocations));
    });

    on<RemoveEpisodeEvent>((event, emit) async {
      final newEpisodes =
          state.episodes.where((episode) => episode.id != event.id).toList();
      emit(state.copyWith(episodes: newEpisodes));
    });

    on<RemoveCharacterEvent>((event, emit) async {
      final newCharacters = state.characters
          .where((character) => character.id != event.id)
          .toList();
      emit(state.copyWith(characters: newCharacters));
    });
  }
}
