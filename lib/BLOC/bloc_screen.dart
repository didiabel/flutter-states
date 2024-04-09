import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/BLOC/bloc_example/example_bloc.dart';
import 'package:flutterstates/BLOC/bloc_example/example_bloc_event.dart';
import 'package:flutterstates/BLOC/bloc_example/example_bloc_state.dart';
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
              // Character Tab View

              CharacterList(
                characters: state.characters,
                isLoading: state.loadingCharacters,
              ),
              // Location Tab View
              LocationList(
                  locations: state.locations,
                  isLoading: state.loadingLocations),

              // Episode Tab View
              EpisodeList(
                episodes: state.episodes,
                isLoading: state.loadingEpisodes,
              )
            ],
          );
        },
      ),
    );
  }
}
