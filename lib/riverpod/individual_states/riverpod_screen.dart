import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/riverpod/individual_states/riverpod_states.dart';
import 'package:flutterstates/screens/character/character_list.dart';
import 'package:flutterstates/screens/episode/episode_list.dart';
import 'package:flutterstates/screens/location/location_list.dart';

class Riverpod extends ConsumerWidget {
  const Riverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class RiverpodScreen extends ConsumerStatefulWidget {
  const RiverpodScreen({super.key});

  @override
  ConsumerState<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends ConsumerState<RiverpodScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Characters'),
            Tab(text: 'Locations'),
            Tab(text: 'Episodes'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Consumer(
            builder: (context, watch, child) {
              final characters = ref.watch(charactersStateProvider);
              return CharacterList(characters: characters);
            },
          ),
          Consumer(
            builder: (context, watch, child) {
              final locations = ref.watch(locationsStateProvider);
              return LocationList(locations: locations);
            },
          ),
          Consumer(
            builder: (context, watch, child) {
              final episodes = ref.watch(episodesStateProvider);
              return EpisodeList(episodes: episodes);
            },
          ),
        ],
      ),
    );
  }
}
