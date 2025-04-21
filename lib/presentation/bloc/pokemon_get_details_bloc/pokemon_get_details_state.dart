
import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/pokemon_get_details_dto.dart';

sealed class PokemonGetDetailsState extends Equatable {
  const PokemonGetDetailsState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonGetDetailsState {}

class PokemonLoading extends PokemonGetDetailsState {}

class PokemonLoaded extends PokemonGetDetailsState {
  final PokemonGetDetailsDTO pokemonDetails;

  const PokemonLoaded({
    required this.pokemonDetails,
  });

  @override
  List<Object?> get props => [pokemonDetails];
}

class PokemonError extends PokemonGetDetailsState {
  final String message;

  const PokemonError(this.message);

  @override
  List<Object> get props => [message];
}