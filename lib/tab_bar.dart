import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/BLOC/bloc_example/example_bloc.dart';
import 'package:flutterstates/BLOC/bloc_screen.dart';
import 'package:flutterstates/riverpod/riverpod_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarState();
}

class _TabBarState extends State<TabBarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget? bottomBar;
  int selectedScreen = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => BLOC(),
      child: const BLOCScreen(),
    ),
    const RiverpodScreen(),
  ];

  @override
  void deactivate() {
    super.deactivate();
  }

  void setTabBar(Widget? newTabBar) {
    setState(() {
      bottomBar = newTabBar;
    });
  }

  // Check if there are any navigation events (such as deep links or push notifications)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedScreen],
      bottomNavigationBar: SafeArea(
        child: bottomBar ??
            BottomNavigationBar(
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
                if (index != selectedScreen) {
                  setState(() {
                    selectedScreen = index;
                  });
                }
              },
            ),
      ),
    );
  }
}
