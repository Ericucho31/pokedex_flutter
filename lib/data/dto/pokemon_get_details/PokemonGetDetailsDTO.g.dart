// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PokemonGetDetailsDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailsDTO _$PokemonDetailsDTOFromJson(Map<String, dynamic> json) =>
    PokemonDetailsDTO(
      pokemons:
          (json['pokemon_v2_pokemon'] as List<dynamic>)
              .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
              .toList(),
      flavorTexts:
          (json['pokemon_v2_pokemonspeciesflavortext'] as List<dynamic>)
              .map((e) => PokemonFlavorText.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PokemonDetailsDTOToJson(PokemonDetailsDTO instance) =>
    <String, dynamic>{
      'pokemon_v2_pokemon': instance.pokemons.map((e) => e.toJson()).toList(),
      'pokemon_v2_pokemonspeciesflavortext':
          instance.flavorTexts.map((e) => e.toJson()).toList(),
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  weight: (json['weight'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  abilities:
      (json['pokemon_v2_pokemonabilities'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
  types:
      (json['pokemon_v2_pokemontypes'] as List<dynamic>)
          .map((e) => PokemonTypeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
  stats:
      (json['pokemon_v2_pokemonstats'] as List<dynamic>)
          .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
  sprites:
      (json['pokemon_v2_pokemonsprites'] as List<dynamic>)
          .map((e) => PokemonSprites.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'weight': instance.weight,
  'height': instance.height,
  'pokemon_v2_pokemonabilities':
      instance.abilities.map((e) => e.toJson()).toList(),
  'pokemon_v2_pokemontypes': instance.types.map((e) => e.toJson()).toList(),
  'pokemon_v2_pokemonstats': instance.stats.map((e) => e.toJson()).toList(),
  'pokemon_v2_pokemonsprites': instance.sprites.map((e) => e.toJson()).toList(),
};

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      ability: Ability.fromJson(
        json['pokemon_v2_ability'] as Map<String, dynamic>,
      ),
      isHidden: json['is_hidden'] as bool,
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'pokemon_v2_ability': instance.ability.toJson(),
      'is_hidden': instance.isHidden,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  effects:
      (json['pokemon_v2_abilityeffecttexts'] as List<dynamic>)
          .map((e) => AbilityEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'pokemon_v2_abilityeffecttexts': instance.effects,
};

AbilityEffect _$AbilityEffectFromJson(Map<String, dynamic> json) =>
    AbilityEffect(
      shortEffect: json['short_effect'] as String,
      languageId: (json['language_id'] as num).toInt(),
    );

Map<String, dynamic> _$AbilityEffectToJson(AbilityEffect instance) =>
    <String, dynamic>{
      'short_effect': instance.shortEffect,
      'language_id': instance.languageId,
    };

PokemonTypeSlot _$PokemonTypeSlotFromJson(Map<String, dynamic> json) =>
    PokemonTypeSlot(
      slot: (json['slot'] as num).toInt(),
      type: PokemonType.fromJson(
        json['pokemon_v2_type'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PokemonTypeSlotToJson(PokemonTypeSlot instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'pokemon_v2_type': instance.type.toJson(),
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  typeEfficacies:
      (json['pokemonV2TypeefficaciesByTargetTypeId'] as List<dynamic>)
          .map((e) => TypeEfficacy.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pokemonV2TypeefficaciesByTargetTypeId':
          instance.typeEfficacies.map((e) => e.toJson()).toList(),
    };

TypeEfficacy _$TypeEfficacyFromJson(Map<String, dynamic> json) => TypeEfficacy(
  id: (json['id'] as num).toInt(),
  damageFactor: (json['damage_factor'] as num).toInt(),
  type: PokemonTypeSimple.fromJson(
    json['pokemon_v2_type'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TypeEfficacyToJson(TypeEfficacy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'damage_factor': instance.damageFactor,
      'pokemon_v2_type': instance.type.toJson(),
    };

PokemonTypeSimple _$PokemonTypeSimpleFromJson(Map<String, dynamic> json) =>
    PokemonTypeSimple(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PokemonTypeSimpleToJson(PokemonTypeSimple instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
  baseStat: (json['base_stat'] as num).toInt(),
  statId: (json['stat_id'] as num).toInt(),
);

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat_id': instance.statId,
    };

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      id: (json['id'] as num).toInt(),
      sprites: json['sprites'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{'id': instance.id, 'sprites': instance.sprites};

PokemonFlavorText _$PokemonFlavorTextFromJson(Map<String, dynamic> json) =>
    PokemonFlavorText(
      speciesId: (json['pokemon_species_id'] as num).toInt(),
      flavorText: json['flavor_text'] as String,
      version: PokemonVersion.fromJson(
        json['pokemon_v2_version'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PokemonFlavorTextToJson(PokemonFlavorText instance) =>
    <String, dynamic>{
      'pokemon_species_id': instance.speciesId,
      'flavor_text': instance.flavorText,
      'pokemon_v2_version': instance.version.toJson(),
    };

PokemonVersion _$PokemonVersionFromJson(Map<String, dynamic> json) =>
    PokemonVersion(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PokemonVersionToJson(PokemonVersion instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
