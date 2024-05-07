import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutterstates/blocs/auth_bloc/auth_event.dart';
import 'package:flutterstates/blocs/auth_bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            children: [
              Builder(
                builder: (context) {
                  if (state.session == null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No session'),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(SignInEvent(email: '', password: ''));
                          },
                          child: const Text('Sign In'),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Text('Welcome ${state.session?.user.username}'),
                      ElevatedButton(
                          child: const Text('Sign Out'),
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(SignOutEvent());
                          })
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
