
import 'package:equatable/equatable.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/PokemonGetDetailsDTO.dart';
import 'package:flutter_pokedex/data/dto/pokemon_get_details/pokemon_get_details_dto.dart';
import 'package:flutter_pokedex/domain/model/pokemon_get_details_model.dart';

sealed class PokemonGetDetailsState extends Equatable {
  const PokemonGetDetailsState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonGetDetailsState {}

class PokemonLoading extends PokemonGetDetailsState {}

class PokemonLoaded extends PokemonGetDetailsState {
  final PokemonGetDetailsModel pokemonDetails;

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