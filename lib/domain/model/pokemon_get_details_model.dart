import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/domain/model/abilities/AbilityModel.dart';
import 'package:flutter_pokedex/domain/model/types/TypeModel.dart';

class PokemonGetDetailsModel extends Equatable{
  final int id;
  final String name;
  final String urlImage;
  final double height;
  final double weight;
  final List<TypeModel> types;
  final List<AbillityModel> abillities;
  

  PokemonGetDetailsModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.urlImage,
    required this.abillities
  });

  @override
  List<Object?> get props => [ id, name, urlImage];
}