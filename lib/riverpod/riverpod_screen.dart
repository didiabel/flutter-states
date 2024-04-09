import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          SizedBox(
            child: Center(
              child: Text('Characters'),
            ),
          ),
          // Location Tab View
          SizedBox(
            child: Center(
              child: Text('Locations'),
            ),
          ),
          // Episode Tab View
          SizedBox(
            child: Center(
              child: Text('Episodes'),
            ),
          ),
        ],
      ),
    );
  }
}
