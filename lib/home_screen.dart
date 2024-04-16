import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterstates/riverpod/global_riverpod/global_riverpod_screen.dart';
import 'package:flutterstates/tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: MaterialButton(
              color: Colors.red,
              child: const Text('Normal States Screen'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TabBarScreen()));
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: MaterialButton(
              color: Colors.blue,
              child: const Text('Global Riverpod Screen'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const GlRiverpod();
                    },
                  ),
                );
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class GlRiverpod extends StatelessWidget {
  const GlRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: GlobalRiverpodScreen());
  }
}
