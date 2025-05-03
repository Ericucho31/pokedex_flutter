
import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/domain/model/pokemon_get_all_model.dart';

sealed class PokemonGetAllState extends Equatable {
  const PokemonGetAllState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonGetAllState {}

class PokemonLoading extends PokemonGetAllState {}

class PokemonLoaded extends PokemonGetAllState {
  final List<PokemonGetAllModel> pokemons;
  final bool hasReachedMax;

  const PokemonLoaded({
    required this.pokemons,
    this.hasReachedMax = false
  });

  @override
  List<Object?> get props => [pokemons, hasReachedMax];
}

class PokemonError extends PokemonGetAllState {
  final String message;

  const PokemonError(this.message);

  @override
  List<Object> get props => [message];
}