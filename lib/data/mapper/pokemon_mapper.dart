
import 'package:flutter_pokedex/data/dto/pokemon_get_details/PokemonGetDetailsDTO.dart';
import 'package:flutter_pokedex/domain/entity/pokemon_types.dart';
import 'package:flutter_pokedex/domain/model/abilities/AbilityModel.dart';
import 'package:flutter_pokedex/domain/model/pokemon_get_details_model.dart';
import 'package:flutter_pokedex/domain/model/types/TypeModel.dart';

extension toDomainModeld on PokemonDetailsDTO {
  PokemonGetDetailsModel toDomainModel() {
    final spritesMap = this.pokemons[0].sprites[0].sprites; // Accedemos al Map de sprites
    final frontDefaultUrl = spritesMap['home']?['front_default']; // Accedemos a la URL específica
    final List<PokemonAbility> abillities = this.pokemons[0].abilities;
    final List<PokemonTypeSlot> typesDTO = this.pokemons[0].types;

    return PokemonGetDetailsModel(
      id: this.pokemons[0].id,
      name: this.pokemons[0].name,
      weight: this.pokemons[0].weight.toDouble(),
      height: this.pokemons[0].height.toDouble(),
      urlImage: frontDefaultUrl,
      abillities: abillities.map((abillity) =>
          AbillityModel(
              id: abillity.ability.id,
              name: abillity.ability.name,
              description: abillity.ability.effects[0].shortEffect,
              slot: abillities.indexOf(abillity),
              isHidden: abillity.isHidden
          )
      ).toList(),
      types: typesDTO.map((type) =>
          TypeModel(
              id: type.type.id,
              name: type.type.name,
              color: PokemonTypeEnum.values[type.type.id].color,
              slot: type.slot
          )
      ).toList(),

    );
  }
}