
import 'dart:convert';

import 'package:flutter_pokedex/data/dto/pokemon_get_all_dto.dart';
import 'package:flutter_pokedex/data/model/pokemon_model.dart';
import '../../core/constants.dart';
import 'package:http/http.dart' as http;

abstract class PokemonDataSource {
  Future<List<PokemonGetAllDto>> getAllPokemon(int limit, int offset);
  Future<PokemonModel> getPokemonDetails(String name);
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

      // Obtenemos los detalles de los pokemons de maner asincrona
      List<PokemonModel> pokemonModels = await Future.wait(
          pokemonList.map((pokemon) => getPokemonDetails(pokemon.name))
      );

      return pokemonList;

    } else {
      throw Exception('Failed to load pokemons');
    }
  }

  @override
  Future<PokemonModel> getPokemonDetails(String name) async {
    final response = await client.get(
      Uri.parse('$baseUrl/pokemon/$name'),
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJSON(json.decode(response.body));
    } else {
      throw Exception('Failed to load pokemon detail');
    }
  }
  
}