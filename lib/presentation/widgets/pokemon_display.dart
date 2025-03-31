import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_bloc.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_state.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_card.dart';

class AllPokemonDisplay extends StatelessWidget {
  const AllPokemonDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonGetAllBloc, PokemonGetAllState>(
      builder: (context, state) {
        switch (state) {
          case PokemonInitial():
            return const Center(child: CircularProgressIndicator());

          case PokemonLoading():
            return const Center(child: CircularProgressIndicator());

          case PokemonLoaded():
            return GridView.count(
              crossAxisCount: 3,
              children: state.pokemons
                  .map((pokemon) => PokemonCard(name: pokemon.name, url: pokemon.urlImage))
                  .toList(),
            );

          default:
            return const Center(child: Text('Estado no manejado'));
        }
      },
    );
  }
}