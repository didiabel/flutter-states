import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;
import 'package:flutterstates/BLOC/example_bloc/example_bloc_state.dart';
import 'package:flutterstates/riverpod/global_riverpod/global_riverpod_controller.dart';

// most important part
final globalRiverpodState =
    rp.StateNotifierProvider<MyStateController, BLOCState>(
  (ref) {
    final controller = MyStateController(
      BLOCState(
        locations: [],
        characters: [],
        episodes: [],
        loadingEpisodes: true,
        loadingCharacters: true,
        loadingLocations: true,
      ),
    );

    return controller;
  },
);
