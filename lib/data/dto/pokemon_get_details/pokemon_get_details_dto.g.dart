// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_get_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonGetDetailsDTO _$PokemonGetDetailsDTOFromJson(
  Map<String, dynamic> json,
) => PokemonGetDetailsDTO(
  stats:
      (json['stats'] as List<dynamic>)
          .map((e) => StatsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PokemonGetDetailsDTOToJson(
  PokemonGetDetailsDTO instance,
) => <String, dynamic>{'stats': instance.stats};
