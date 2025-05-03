
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_details_bloc/pokemon_get_details_bloc.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_details_bloc/pokemon_get_details_state.dart';

class DetailsPokemonDisplay extends StatelessWidget {
  const DetailsPokemonDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonGetDetailsBloc, PokemonGetDetailsState>(
      builder: (context, state) {
        switch (state) {
          case PokemonInitial():
            return const Center(child: CircularProgressIndicator());

          case PokemonLoading():
            return const Center(child: Row(
              children: [CircularProgressIndicator(), Text("Cargando informacion de los Pokémon")],
            ));

          case PokemonLoaded():
            return Center(
              child: Column(
                children: [
                  Text(state.pokemonDetails.id.toString()),
                  Text(state.pokemonDetails.name),
                  ...state.pokemonDetails.types.map((type) =>
                      Text(
                        type.name, style: TextStyle(color: type.color),
                      )).toList(),
                  Image.network(
                    state.pokemonDetails.urlImage,
                    fit: BoxFit.fill,
                  ),
                  ...state.pokemonDetails.abillities.map((ability) => Text(
                      "Abillities: ${ability.name}")).toList(),
                  Text("Weight : ${state.pokemonDetails.weight.toString()}"),
                  Text("Height : ${state.pokemonDetails.height.toString()}"),
                ],
              ),
            );

          default:
            return const Center(child: Text('Estado no manejado'));
        }
      },
    );
  }
}