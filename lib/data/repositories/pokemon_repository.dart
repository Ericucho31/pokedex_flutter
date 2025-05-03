
import 'package:flutter_pokedex/core/errors.dart';
import 'package:flutter_pokedex/data/data_source/pokemon_data_source.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_all_dto.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/PokemonGetDetailsDTO.dart';
import 'package:flutter_pokedex/domain/model/pokemon_get_all_model.dart';
import 'package:flutter_pokedex/domain/interfaces/IPokemonRepository.dart';
import 'package:fpdart/src/either.dart';
import '../../core/constants.dart';

class PokemonRepository implements IPokemonRespository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepository({required this.pokemonDataSource});

  @override
  Future<Either<PokeError, List<PokemonGetAllModel>>> getAllPokemon(int limit, int offset) async {
    try{
      // Obtiene los datos de los pokemones
      final List<PokemonGetAllDto> pokemonDtos = await pokemonDataSource.getAllPokemon(limit, offset);

      // Regresa la entidad de PokemonGetAll para la capa de negocio
      List<PokemonGetAllModel> pokemonModels = pokemonDtos.map((pokemonDto) {
        List<String> detailsUrlSplited = pokemonDto.url.split("/");
        String id = detailsUrlSplited[detailsUrlSplited.length - 2];

        return PokemonGetAllModel(
            id: int.parse(id),
            name: pokemonDto.name,
            urlDetails: pokemonDto.url,
            urlImage: getOfficialArtworkUrl(id)
        );
      }).toList();
      
      return Right(pokemonModels);
    }
    catch(e)
    {
      return Left(NetworkError());
    }
  }

  @override
  Future<Either<PokeError, PokemonDetailsDTO>> getPokemonDetails(int pokemonId) async {
    try {
      final PokemonDetailsDTO pokemonDetails = await pokemonDataSource.getPokemonDetails(pokemonId);
      return Right(pokemonDetails);
    }
    catch(e)
    {
      return Left(NetworkError());
    }
  }
}

String getOfficialArtworkUrl(String id) {
  return "$officialArtworkUrl$id.png";
}