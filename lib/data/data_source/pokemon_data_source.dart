
import 'dart:convert';

import 'package:flutter_pokedex/data/dto/pokemon_get_all_dto.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/pokemon_get_details_dto.dart';
import '../../core/constants.dart';
import 'package:http/http.dart' as http;

abstract class PokemonDataSource {
  Future<List<PokemonGetAllDto>> getAllPokemon(int limit, int offset);
  Future<PokemonGetDetailsDTO> getPokemonDetails(int pokemonId);
}

class PokemonDataSourceImp implements PokemonDataSource {
  final http.Client client;

  // Constructor con parámetro obligatorio
  PokemonDataSourceImp({required this.client});

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
  Future<PokemonGetDetailsDTO> getPokemonDetails(int pokemonId) async {
    final response = await client.get(
      Uri.parse('$baseUrl/pokemon/$pokemonId'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      PokemonGetDetailsDTO pokemonDetails = PokemonGetDetailsDTO.fromJson(jsonData);
      return pokemonDetails;
    } else {
      throw Exception('Failed to load pokemon detail');
    }
  }
  
}