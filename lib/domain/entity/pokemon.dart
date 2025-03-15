import 'package:flutter_pokedex/domain/enum/pokemon_types.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUri;
  final List<PokemonTypes> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUri,
    required this.types
  });
}