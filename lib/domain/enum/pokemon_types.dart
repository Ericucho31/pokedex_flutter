
import 'dart:ui';

import 'package:flutter/material.dart';

enum PokemonTypes {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
  unknown;

  static PokemonTypes fromString(String type) {
    try {
      return PokemonTypes.values.firstWhere(
          (e) => e.name.toLowerCase() == type.toLowerCase()
      );
    } catch(_) {
      return PokemonTypes.unknown;
    }
  }

  String get displayName => name.toUpperCase();

  Color get color {
    switch (this) {
      case PokemonTypes.grass:
        return Colors.green;
      case PokemonTypes.fire:
        return Colors.red;
      case PokemonTypes.water:
        return Colors.blue;
      case PokemonTypes.electric:
        return Colors.yellow;
      case PokemonTypes.psychic:
        return Colors.purple;
      case PokemonTypes.fighting:
        return Colors.orange;
      case PokemonTypes.rock:
        return Colors.brown;
      case PokemonTypes.ground:
        return Colors.brown.shade300;
      case PokemonTypes.flying:
        return Colors.indigo.shade200;
      case PokemonTypes.bug:
        return Colors.lightGreen;
      case PokemonTypes.poison:
        return Colors.deepPurple;
      case PokemonTypes.normal:
        return Colors.grey;
      case PokemonTypes.ghost:
        return Colors.indigo;
      case PokemonTypes.dragon:
        return Colors.indigo.shade800;
      case PokemonTypes.dark:
        return Colors.grey.shade800;
      case PokemonTypes.steel:
        return Colors.blueGrey;
      case PokemonTypes.fairy:
        return Colors.pink;
      case PokemonTypes.ice:
        return Colors.lightBlue;
      case PokemonTypes.unknown:
      return Colors.grey;
    }
  }

}