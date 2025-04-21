
import 'package:flutter_pokedex/core/errors.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/pokemon_get_details_dto.dart';
import 'package:flutter_pokedex/data/model/pokemon_get_all_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class IPokemonRespository {
  Future<Either<PokeError, List<PokemonGetAllModel>>> getAllPokemon(int limit, int offset);
  Future<Either<PokeError, PokemonGetDetailsDTO>> getPokemonDetails(int pokemonId);
}