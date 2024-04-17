import 'package:flutter/material.dart';
import 'package:flutterstates/models/character.dart';
import 'package:flutterstates/screens/character/character_card.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  final bool isLoading;
  final void Function(int characterId) onDeleteCharacter;

  const CharacterList({
    super.key,
    required this.characters,
    this.isLoading = false,
    required this.onDeleteCharacter,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        if (characters.isEmpty) {
          return const Center(
            child: Text('No characters found'),
          );
        }

        return CharacterCard(
          character: characters[index],
          onDeleteCharacter: onDeleteCharacter,
        );
      },
    );
  }
}
