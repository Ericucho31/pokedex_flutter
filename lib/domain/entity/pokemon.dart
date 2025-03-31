import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/domain/enum/pokemon_types.dart';

class Pokemon extends Equatable{
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

  @override
  List<Object> get props => [id, name, imageUri, types];
}