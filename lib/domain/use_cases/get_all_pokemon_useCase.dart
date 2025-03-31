
import 'package:flutter_pokedex/core/errors.dart';
import 'package:flutter_pokedex/data/model/pokemon_get_all_model.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllPokemonUseCase{
  final PokemonRepository pokemonRepository;

  GetAllPokemonUseCase({required this.pokemonRepository});

  Future<Either<PokeError, List<PokemonGetAllModel>>> call(
      {int limit = 20, int offset = 0}
      ) async {
    return pokemonRepository.getAllPokemon(limit, offset);
  }

}