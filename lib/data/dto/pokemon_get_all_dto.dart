import 'package:json_annotation/json_annotation.dart';

part 'pokemon_get_all_dto.g.dart';

@JsonSerializable()
class PokemonGetAllDto {
  final String name;
  final String url;

  PokemonGetAllDto({required this.name, required this.url});

  // Factory constructor para crear un objeto desde JSON
  factory PokemonGetAllDto.fromJson(Map<String, dynamic> json) =>
      _$PokemonGetAllDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonGetAllDtoToJson(this);
}