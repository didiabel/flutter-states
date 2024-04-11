import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/riverpod/global_riverpod/global_riverpod.dart';
import 'package:flutterstates/screens/character/character_list.dart';
import 'package:flutterstates/screens/episode/episode_list.dart';
import 'package:flutterstates/screens/location/location_list.dart';

class GlobalRiverpodScreen extends ConsumerStatefulWidget {
  const GlobalRiverpodScreen({super.key});

  @override
  ConsumerState<GlobalRiverpodScreen> createState() =>
      _GlobalRiverpodScreenState();
}

class _GlobalRiverpodScreenState extends ConsumerState<GlobalRiverpodScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    ref.read(globalRiverpodState.notifier).fetchData();
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
        title: const Text('Global Riverpod Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Characters'),
            Tab(text: 'Locations'),
            Tab(text: 'Episodes'),
          ],
        ),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          final state = ref.watch(globalRiverpodState);
          return TabBarView(
            controller: _tabController,
            children: [
              CharacterList(
                characters: state.characters,
                isLoading: state.isCharactersLoading,
              ),
              LocationList(
                locations: state.locations,
                isLoading: state.isLocationsLoading,
              ),
              EpisodeList(
                episodes: state.episodes,
                isLoading: state.isEpisodesLoading,
              ),
            ],
          );
        },
      ),
    );
  }
}
