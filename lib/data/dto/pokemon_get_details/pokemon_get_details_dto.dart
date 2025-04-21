import 'package:flutter_pokedex/data/dto/pokemon_get_details/stats_dto/stats_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_get_details_dto.g.dart';

@JsonSerializable()
class PokemonGetDetailsDTO {
  final List<StatsDTO> stats;

  PokemonGetDetailsDTO({required this.stats});

  factory PokemonGetDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$PokemonGetDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonGetDetailsDTOToJson(this);
}