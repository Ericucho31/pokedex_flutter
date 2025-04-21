
import 'package:flutter_pokedex/data/dto/pokemon_get_details/pokemon_get_details_dto.dart';
import 'package:flutter_pokedex/domain/interfaces/IPokemonRepository.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/errors.dart';

class GetPokemonDetailsUsecase{
  final IPokemonRespository pokemonRepository;

  GetPokemonDetailsUsecase({required this.pokemonRepository});

  Future<Either<PokeError, PokemonGetDetailsDTO>> call(int pokemonId) async {
    return pokemonRepository.getPokemonDetails(pokemonId);
  }
}