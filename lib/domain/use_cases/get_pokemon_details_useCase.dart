
import 'package:flutter_pokedex/data/dto/pokemon_get_details/PokemonGetDetailsDTO.dart';
import 'package:flutter_pokedex/data/mapper/pokemon_mapper.dart';
import 'package:flutter_pokedex/domain/interfaces/IPokemonRepository.dart';
import 'package:flutter_pokedex/domain/model/pokemon_get_details_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/errors.dart';

class GetPokemonDetailsUsecase{
  final IPokemonRespository pokemonRepository;

  GetPokemonDetailsUsecase({required this.pokemonRepository});

  Future<Either<PokeError, PokemonGetDetailsModel>> call(int pokemonId) async {
    try {
      Either<PokeError, PokemonDetailsDTO> response = await pokemonRepository.getPokemonDetails(pokemonId);
      var pokemonDetailModel = response.fold(
          (error ) => throw Left(error),
          (pokemonResponse) => pokemonResponse.toDomainModel()
      );
      return Right(pokemonDetailModel);

    } catch(e) {
      throw Exception(e);
    }
  }
}