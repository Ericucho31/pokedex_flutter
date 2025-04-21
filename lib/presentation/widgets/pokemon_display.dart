import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/use_cases/get_pokemon_details_useCase.dart';
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
            return const Center(child: Row(
              children: [CircularProgressIndicator(), Text("Cargando informacion de los Pokémon")],
            ));

          case PokemonLoaded():
            return GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1, // 3 columnas para pantallas grandes, 2 para pantallas pequeñas
              children: state.pokemons
                  .map((pokemon) => PokemonCard(id: pokemon.id ,name: pokemon.name, url: pokemon.urlImage,))
                  .toList(),
            );

          default:
            return const Center(child: Text('Estado no manejado'));
        }
      },
    );
  }
}