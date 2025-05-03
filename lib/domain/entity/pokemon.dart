import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/domain/entity/pokemon_types.dart';

class PokemonEntity extends Equatable{
  final int id;
  final String name;
  final List<PokemonTypeEnum> types;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.types
  });

  @override
  List<Object> get props => [id, name, types];
}