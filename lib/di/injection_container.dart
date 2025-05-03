import 'package:flutter_pokedex/core/constants.dart';
import 'package:flutter_pokedex/data/data_source/pokemon_data_source.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/domain/interfaces/IPokemonRepository.dart';
import 'package:flutter_pokedex/domain/use_cases/get_all_pokemon_useCase.dart';
import 'package:flutter_pokedex/domain/use_cases/get_pokemon_details_useCase.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart';

final inject = GetIt.instance;

Future<void> init() async {

  //Use Case
  inject.registerLazySingleton( () => GetPokemonDetailsUsecase(pokemonRepository: inject()) );
  inject.registerLazySingleton( () => GetAllPokemonUseCase(pokemonRepository: inject()) );
  
  // Repositories
  inject.registerLazySingleton<IPokemonRespository>( () => PokemonRepository(pokemonDataSource: inject()), );
  
  //Data source
  inject.registerLazySingleton<PokemonDataSource>( () => PokemonDataSourceImp(client: inject(), graphQLClient: inject()));
  
  //HttpClient
  inject.registerLazySingleton(() => Client());
  inject.registerLazySingleton(() => GraphQLClient(link: graphQlLink, cache: GraphQLCache()));
}

