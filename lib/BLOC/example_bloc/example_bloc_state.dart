import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/models/episode.dart';
import 'package:flutterstates/models/location.dart';

class BLOCState {
  List<Episode> episodes = [];
  List<Character> characters = [];
  List<Location> locations = [];
  bool loadingEpisodes = false;
  bool loadingCharacters = false;
  bool loadingLocations = false;

  BLOCState({
    this.episodes = const [],
    this.characters = const [],
    this.locations = const [],
    this.loadingEpisodes = false,
    this.loadingCharacters = false,
    this.loadingLocations = false,
  });

  BLOCState copyWith({
    List<Episode>? episodes,
    List<Character>? characters,
    List<Location>? locations,
    bool? loadingEpisodes,
    bool? loadingCharacters,
    bool? loadingLocations,
  }) {
    return BLOCState(
      episodes: episodes ?? this.episodes,
      characters: characters ?? this.characters,
      locations: locations ?? this.locations,
      loadingEpisodes: loadingEpisodes ?? this.loadingEpisodes,
      loadingCharacters: loadingCharacters ?? this.loadingCharacters,
      loadingLocations: loadingLocations ?? this.loadingLocations,
    );
  }
}
