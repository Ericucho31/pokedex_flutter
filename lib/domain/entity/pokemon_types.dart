
import 'dart:ui';

import 'package:flutter/material.dart';

enum PokemonTypeEnum {
  unknown,
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy;

  static PokemonTypeEnum fromString(String type) {
    try {
      return PokemonTypeEnum.values.firstWhere(
          (e) => e.name.toLowerCase() == type.toLowerCase()
      );
    } catch(_) {
      return PokemonTypeEnum.unknown;
    }
  }

  String get displayName => name.toUpperCase();

  Color get color {
    switch (this) {
      case PokemonTypeEnum.grass:
        return Colors.green;
      case PokemonTypeEnum.fire:
        return Colors.red;
      case PokemonTypeEnum.water:
        return Colors.blue;
      case PokemonTypeEnum.electric:
        return Colors.yellow;
      case PokemonTypeEnum.psychic:
        return Colors.purple;
      case PokemonTypeEnum.fighting:
        return Colors.orange;
      case PokemonTypeEnum.rock:
        return Colors.brown;
      case PokemonTypeEnum.ground:
        return Colors.brown.shade300;
      case PokemonTypeEnum.flying:
        return Colors.indigo.shade200;
      case PokemonTypeEnum.bug:
        return Colors.lightGreen;
      case PokemonTypeEnum.poison:
        return Colors.deepPurple;
      case PokemonTypeEnum.normal:
        return Colors.grey;
      case PokemonTypeEnum.ghost:
        return Colors.indigo;
      case PokemonTypeEnum.dragon:
        return Colors.indigo.shade800;
      case PokemonTypeEnum.dark:
        return Colors.grey.shade800;
      case PokemonTypeEnum.steel:
        return Colors.blueGrey;
      case PokemonTypeEnum.fairy:
        return Colors.pink;
      case PokemonTypeEnum.ice:
        return Colors.lightBlue;
      case PokemonTypeEnum.unknown:
      return Colors.grey;
    }
  }

}