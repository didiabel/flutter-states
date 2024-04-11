import 'package:flutterstates/apis/apis.dart';
import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/models/episode.dart';
import 'package:flutterstates/models/location.dart';
import 'package:riverpod/riverpod.dart';

/// An object that controls [RiverpodState].

final episodesProvider = FutureProvider<List<Episode>>(
  (ref) async {
    final api = APIs.instance;
    final episodes = await api.getEpisodes();
    return episodes;
  },
);

final charactersProvider = FutureProvider<List<Character>>(
  (ref) async {
    final api = APIs.instance;
    final characters = await api.getCharacters();
    return characters;
  },
);

final locationsProvider = FutureProvider<List<Location>>(
  (ref) async {
    final api = APIs.instance;
    final locations = await api.getLocations();
    return locations;
  },
);
