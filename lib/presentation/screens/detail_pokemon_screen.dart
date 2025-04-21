
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/use_cases/get_pokemon_details_useCase.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_details_bloc/pokemon_get_details_bloc.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_details_bloc/pokemon_get_details_event.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_details_display.dart';

class DetailPokemonScreen extends StatelessWidget {
  final int pokemonId;
  final GetPokemonDetailsUsecase getDetailsPokemonUseCase;

  const DetailPokemonScreen({required this.pokemonId, required this.getDetailsPokemonUseCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon details")),
      body: BlocProvider(
        create: (_) => PokemonGetDetailsBloc(
            getDetailsPokemonUseCase: getDetailsPokemonUseCase,
            pokemonId: pokemonId
        )
          ..add(FetchOnePokemonEvent()),
        child: Builder(
          builder: (context) {
            return DetailsPokemonDisplay();
          },
        ),
      ),
    );
  }
}