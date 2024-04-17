import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc_event.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc_state.dart';
import 'package:flutterstates/screens/character/character_list.dart';
import 'package:flutterstates/screens/episode/episode_list.dart';
import 'package:flutterstates/screens/location/location_list.dart';

class BLOCScreen extends StatefulWidget {
  const BLOCScreen({super.key});

  @override
  State<BLOCScreen> createState() => _BLOCScreenState();
}

class _BLOCScreenState extends State<BLOCScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    BlocProvider.of<BLOC>(context).add(const InitializeBLOCEvent());
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
        title: const Text('BLOC Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Characters'),
            Tab(text: 'Locations'),
            Tab(text: 'Episodes'),
          ],
        ),
      ),
      body: BlocBuilder<BLOC, BLOCState>(
        builder: (context, state) {
          return TabBarView(
            controller: _tabController,
            children: [
              CharacterList(
                characters: state.characters,
                isLoading: state.loadingCharacters,
                onDeleteCharacter: (characterId) {
                  BlocProvider.of<BLOC>(context).add(
                    RemoveCharacterEvent(id: characterId),
                  );
                },
              ),
              LocationList(
                locations: state.locations,
                isLoading: state.loadingLocations,
                onDeleteLocation: (locationId) {
                  BlocProvider.of<BLOC>(context).add(
                    RemoveLocationEvent(id: locationId),
                  );
                },
              ),
              EpisodeList(
                  episodes: state.episodes,
                  isLoading: state.loadingEpisodes,
                  onDeleteEpisode: (episodeId) {
                    BlocProvider.of<BLOC>(context).add(
                      RemoveEpisodeEvent(id: episodeId),
                    );
                  })
            ],
          );
        },
      ),
    );
  }
}
