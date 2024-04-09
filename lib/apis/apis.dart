import 'dart:convert';

import 'package:flutterstates/apis/request_handler.dart';
import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/models/location.dart';
import 'package:flutterstates/models/episode.dart';

class APIs {
  late RequestHandler _requestHandler;

  static APIs instance = APIs._();

  APIs._() {
    _requestHandler = RequestHandler();
  }

  Future<Character> getCharacter(int characterId) async {
    final response = await _requestHandler.get('/api/character/$characterId');
    final json = jsonDecode(response.body);
    return Character.fromJson(json);
  }

  Future<Location> getLocation(int locationId) async {
    final response = await _requestHandler.get('/api/location/$locationId');
    final json = jsonDecode(response.body);
    return Location.fromJson(json);
  }

  Future<Episode> getEpisode(int episodeId) async {
    final response = await _requestHandler.get('/api/episode/$episodeId');
    final json = jsonDecode(response.body);
    return Episode.fromJson(json);
  }

  Future<List<Character>> getCharacters({int page = 1}) async {
    final queryParams = {'page': page.toString()};
    final response = await _requestHandler.get(
      '/api/character',
      queryParameters: queryParams,
    );

    final List<dynamic> jsonList = jsonDecode(response.body)['results'];
    return jsonList.map((json) => Character.fromJson(json)).toList();
  }

  Future<List<Location>> getLocations({int page = 1}) async {
    final queryParams = {'page': page.toString()};
    final response = await _requestHandler.get(
      '/api/location',
      queryParameters: queryParams,
    );

    final List<dynamic> jsonList = jsonDecode(response.body)['results'];
    return jsonList.map((json) => Location.fromJson(json)).toList();
  }

  Future<List<Episode>> getEpisodes({int page = 1}) async {
    final queryParams = {'page': page.toString()};
    final response = await _requestHandler.get(
      '/api/episode',
      queryParameters: queryParams,
    );

    final List<dynamic> jsonList = jsonDecode(response.body)['results'];
    return jsonList.map((json) => Episode.fromJson(json)).toList();
  }
}
