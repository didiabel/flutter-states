import 'package:flutter/material.dart';
import 'package:flutterstates/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final Function(int characterId) onDeleteCharacter;

  const CharacterCard({
    super.key,
    required this.character,
    required this.onDeleteCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    character.name,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                IconButton(
                    onPressed: () => onDeleteCharacter(character.id),
                    icon: const Icon(Icons.delete)),
              ],
            ),
            Text(
              character.status,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              character.species,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              character.type,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              character.gender,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Image.network(
              character.image,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
