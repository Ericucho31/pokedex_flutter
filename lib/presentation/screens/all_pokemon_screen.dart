
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/model/pokemon_model.dart';
import 'package:flutter_pokedex/domain/enum/pokemon_types.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_card.dart';

class AllPokemonScreen extends StatefulWidget {
  const AllPokemonScreen({
    super.key
  });

  @override
  State<AllPokemonScreen> createState() => _AllPokemonScreen();
}

List<PokemonModel> pokemons =[
  PokemonModel(id: 1, name: 'Bulbasaur', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png', types: [PokemonTypes.grass, PokemonTypes.poison]),
  PokemonModel(id: 2, name: 'Ivysaur', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png', types: [PokemonTypes.grass, PokemonTypes.poison]),
  PokemonModel(id: 3, name: 'Venasaur', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png', types: [PokemonTypes.grass, PokemonTypes.poison]),
  PokemonModel(id: 4, name: 'Charmander', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png', types: [PokemonTypes.fire]),
  PokemonModel(id: 5, name: 'Charmeleon', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png', types: [PokemonTypes.fire]),
  PokemonModel(id: 6, name: 'Charizard', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png', types: [PokemonTypes.fire, PokemonTypes.flying]),
  PokemonModel(id: 4, name: 'Squirtle', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png', types: [PokemonTypes.water]),
  PokemonModel(id: 5, name: 'Wartortle', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png', types: [PokemonTypes.water]),
  PokemonModel(id: 6, name: 'Blastoise', imageUri: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png', types: [PokemonTypes.water]),
];

class _AllPokemonScreen extends State<AllPokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("All Pokemon Pokedex"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: pokemons
            .map((pokemon) => PokemonCard(name: pokemon.name, url: pokemon.imageUri))
            .toList()
        ,
      ),
    );
  }
}