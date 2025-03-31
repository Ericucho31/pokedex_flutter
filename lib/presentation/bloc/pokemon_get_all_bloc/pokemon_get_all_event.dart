import 'package:equatable/equatable.dart';

sealed class PokemonGetAllEvent  {
  const PokemonGetAllEvent();
}

final class FetchAllPokemonEvent extends PokemonGetAllEvent {}

final class PokemonRefreshEvent extends PokemonGetAllEvent {}