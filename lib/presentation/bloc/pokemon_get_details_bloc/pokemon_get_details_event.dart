
sealed class PokemonGetDetailsEvent  {
  const PokemonGetDetailsEvent();
}

final class FetchOnePokemonEvent extends PokemonGetDetailsEvent {}

final class PokemonRefreshEvent extends PokemonGetDetailsEvent {}