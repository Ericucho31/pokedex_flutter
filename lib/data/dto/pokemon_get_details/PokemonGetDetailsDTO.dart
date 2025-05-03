import 'package:json_annotation/json_annotation.dart';

part 'PokemonGetDetailsDTO.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonDetailsDTO {
  @JsonKey(name: 'pokemon_v2_pokemon')
  final List<Pokemon> pokemons;

  @JsonKey(name: 'pokemon_v2_pokemonspeciesflavortext')
  final List<PokemonFlavorText> flavorTexts;

  PokemonDetailsDTO({required this.pokemons, required this.flavorTexts});

  factory PokemonDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Pokemon {
  final int id;
  final String name;
  final int weight;
  final int height;

  @JsonKey(name: 'pokemon_v2_pokemonabilities')
  final List<PokemonAbility> abilities;

  @JsonKey(name: 'pokemon_v2_pokemontypes')
  final List<PokemonTypeSlot> types;

  @JsonKey(name: 'pokemon_v2_pokemonstats')
  final List<PokemonStat> stats;

  @JsonKey(name: 'pokemon_v2_pokemonsprites')
  final List<PokemonSprites> sprites;

  Pokemon({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.abilities,
    required this.types,
    required this.stats,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class PokemonAbility {
  @JsonKey(name: 'pokemon_v2_ability')
  final Ability ability;

  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  PokemonAbility({required this.ability, required this.isHidden});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

@JsonSerializable()
class Ability {
  final int id;
  final String name;

  @JsonKey(name: 'pokemon_v2_abilityeffecttexts')
  final List<AbilityEffect> effects;

  Ability({required this.id, required this.name, required this.effects});

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class AbilityEffect {
  @JsonKey(name: 'short_effect')
  final String shortEffect;

  @JsonKey(name: 'language_id')
  final int languageId;

  AbilityEffect({required this.shortEffect, required this.languageId});

  factory AbilityEffect.fromJson(Map<String, dynamic> json) =>
      _$AbilityEffectFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityEffectToJson(this);
}

@JsonSerializable()
class PokemonTypeSlot {
  final int slot;

  @JsonKey(name: 'pokemon_v2_type')
  final PokemonType type;

  PokemonTypeSlot({required this.slot, required this.type});

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeSlotToJson(this);
}

@JsonSerializable()
class PokemonType {
  final int id;
  final String name;

  @JsonKey(name: 'pokemonV2TypeefficaciesByTargetTypeId')
  final List<TypeEfficacy> typeEfficacies;

  PokemonType({required this.id, required this.name, required this.typeEfficacies});

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class TypeEfficacy {
  final int id;

  @JsonKey(name: 'damage_factor')
  final int damageFactor;

  @JsonKey(name: 'pokemon_v2_type')
  final PokemonTypeSimple type;

  TypeEfficacy({required this.id, required this.damageFactor, required this.type});

  factory TypeEfficacy.fromJson(Map<String, dynamic> json) =>
      _$TypeEfficacyFromJson(json);

  Map<String, dynamic> toJson() => _$TypeEfficacyToJson(this);
}

@JsonSerializable()
class PokemonTypeSimple {
  final int id;
  final String name;

  PokemonTypeSimple({required this.id, required this.name});

  factory PokemonTypeSimple.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSimpleFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeSimpleToJson(this);
}

@JsonSerializable()
class PokemonStat {
  @JsonKey(name: 'base_stat')
  final int baseStat;

  @JsonKey(name: 'stat_id')
  final int statId;

  PokemonStat({required this.baseStat, required this.statId});

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

@JsonSerializable()
class PokemonSprites {
  final int id;
  final Map<String, dynamic> sprites; // Aquí como es JSON anidado, usamos Map.

  PokemonSprites({required this.id, required this.sprites});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}

@JsonSerializable()
class PokemonFlavorText {
  @JsonKey(name: 'pokemon_species_id')
  final int speciesId;

  @JsonKey(name: 'flavor_text')
  final String flavorText;

  @JsonKey(name: 'pokemon_v2_version')
  final PokemonVersion version;

  PokemonFlavorText({
    required this.speciesId,
    required this.flavorText,
    required this.version,
  });

  factory PokemonFlavorText.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFlavorTextToJson(this);
}

@JsonSerializable()
class PokemonVersion {
  final int id;
  final String name;

  PokemonVersion({required this.id, required this.name});

  factory PokemonVersion.fromJson(Map<String, dynamic> json) =>
      _$PokemonVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonVersionToJson(this);
}