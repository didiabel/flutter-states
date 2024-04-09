import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/models/episode.dart';
import 'package:flutterstates/models/location.dart';

class RiverpodState {
  const RiverpodState({
    this.episodes = const [],
    this.characters = const [],
    this.locations = const [],
    this.loadingEpisodes = false,
    this.loadingCharacters = false,
    this.loadingLocations = false,
  });

  final List<Episode> episodes;
  final List<Character> characters;
  final List<Location> locations;
  final bool loadingEpisodes;
  final bool loadingCharacters;
  final bool loadingLocations;

  RiverpodState copyWith({
    List<Episode>? episodes,
    List<Character>? characters,
    List<Location>? locations,
    bool? loadingEpisodes,
    bool? loadingCharacters,
    bool? loadingLocations,
  }) {
    return RiverpodState(
      episodes: episodes ?? this.episodes,
      characters: characters ?? this.characters,
      locations: locations ?? this.locations,
      loadingEpisodes: loadingEpisodes ?? this.loadingEpisodes,
      loadingCharacters: loadingCharacters ?? this.loadingCharacters,
      loadingLocations: loadingLocations ?? this.loadingLocations,
    );
  }
}
