
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/domain/use_cases/get_all_pokemon_useCase.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_bloc.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_event.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_state.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_display.dart';

class GetAllPokemonScreen extends StatelessWidget {
  final GetAllPokemonUseCase getAllPokemonUseCase;

  const GetAllPokemonScreen({super.key, required this.getAllPokemonUseCase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch all pokemon")),
      body: BlocProvider(
        create: (_) => PokemonGetAllBloc(getAllPokemonUseCase: getAllPokemonUseCase)
          ..add(FetchAllPokemonEvent()),
        child: Builder(
          builder: (context) {
            return const AllPokemonDisplay();
          },
        ),
      ),
    );
  }

}