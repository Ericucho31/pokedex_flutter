import 'package:flutter_pokedex/domain/entity/pokemon.dart';
import 'package:flutter_pokedex/domain/enum/pokemon_types.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required int id,
    required String name,
    required String imageUri,
    required List<PokemonTypes> types,
  }) : super( id: id,
    name: name,
    imageUri: imageUri,
    types: types,
  );
  
  factory PokemonModel.fromJSON(Map<String, dynamic> json) {
    final id = json['id'];
    final types = (json['types'] as List)
        .map((type) => PokemonTypes.fromString(type['type']['name'] as String))
        .toList();

    return PokemonModel(
      id: id,
      name: json['name'],
      imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      types: types,
    );
  }

  factory PokemonModel.fromListJson(Map<String, dynamic> json, int index) {
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonModel(
      id: id,
      name: json['name'],
      imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      types: [], // Se completará en el detalle
    );
  }
}