import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/BLOC/example_bloc/example_bloc.dart';
import 'package:flutterstates/BLOC/bloc_screen.dart';
import 'package:flutterstates/riverpod/individual_states/riverpod_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarState();
}

class _TabBarState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedScreen = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => BLOC(),
      child: const BLOCScreen(),
    ),
    const ProviderScope(
      child: RiverpodScreen(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: screens.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: screens.map((widget) {
          return KeepAliveWrapper(child: widget);
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreen,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.black12,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.brightness_1,
            ),
            label: 'BLOC',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.water,
            ),
            label: "riverpod",
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedScreen = index;
          });
          _tabController.animateTo(index);
        },
      ),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({super.key, required this.child});

  @override
  KeepAliveWrapperState createState() => KeepAliveWrapperState();
}

class KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
