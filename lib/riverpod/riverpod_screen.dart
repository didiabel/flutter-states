import 'package:flutter/material.dart';

class RiverpodScreen extends StatefulWidget {
  const RiverpodScreen({super.key});

  @override
  State<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends State<RiverpodScreen>
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
        children: const [
          // Character Tab View
          // CharacterList(characters: characters, isLoading: isLoading)
          // Location Tab View
          // LocationList(locations: locations, isLoading: isLoading),
          // Episode Tab View
          // EpisodeList(episodes: episodes, isLoading: isLoading),
        ],
      ),
    );
  }
}
