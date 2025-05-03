
import 'dart:convert';

import 'package:flutter_pokedex/data/dto/pokemon_get_all_dto.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/PokemonGetDetailsDTO.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/pokemon_get_details_dto.dart';
import 'package:flutter_pokedex/data/queries/getPokemonDetailsQuery.dart';
import 'package:graphql/client.dart';
import '../../core/constants.dart';
import 'package:http/http.dart' as http;

abstract class PokemonDataSource {
  Future<List<PokemonGetAllDto>> getAllPokemon(int limit, int offset);
  Future<PokemonDetailsDTO> getPokemonDetails(int pokemonId);
}

class PokemonDataSourceImp implements PokemonDataSource {
  final http.Client client;

  final GraphQLClient graphQLClient ;

  // Constructor con parámetro obligatorio
  PokemonDataSourceImp({required this.client, required this.graphQLClient});

  @override
  Future<List<PokemonGetAllDto>> getAllPokemon(int limit, int offset) async {
    final response = await client.get(
      Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset'),
    );

    if(response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> results = jsonData['results'];

      List<PokemonGetAllDto> pokemonList = results.map((json) => PokemonGetAllDto.fromJson(json)).toList();

      return pokemonList;

    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  @override
  Future<PokemonDetailsDTO> getPokemonDetails(int pokemonId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/pokemon/$pokemonId'),
      );

      final graphQLresponse = await graphQLClient.query(
          QueryOptions(
              document: gql(pokemonDetailsQuery),
              variables: {'pokemonId': pokemonId}
          )
      );

      final Map<String, dynamic> jsonGraphData = graphQLresponse.data!;
      PokemonDetailsDTO pokemonResponse = PokemonDetailsDTO.fromJson(jsonGraphData);
      return pokemonResponse;

    } catch(e) {
      throw Exception('Failed to load pokemon detail');
    }
  }
}