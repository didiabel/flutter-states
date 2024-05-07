import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutterstates/home_screen.dart';
import 'package:flutterstates/services/bindings.dart';

void main() {
  Bindings.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc()),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
