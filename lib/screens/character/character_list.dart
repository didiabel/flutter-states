import 'package:flutter/material.dart';
import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/screens/character/character_card.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final bool isLoading;

  const CharacterList({
    super.key,
    required this.characters,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        if (characters.isEmpty) {
          return const Center(
            child: Text('No characters found'),
          );
        }

        return CharacterCard(character: characters[index]);
      },
    );
  }
}
