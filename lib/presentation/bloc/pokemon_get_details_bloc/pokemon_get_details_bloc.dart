
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/domain/model/pokemon_get_details_model.dart';
import 'package:flutter_pokedex/domain/use_cases/get_pokemon_details_useCase.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_details_bloc/pokemon_get_details_event.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_details_bloc/pokemon_get_details_state.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/errors.dart';

class PokemonGetDetailsBloc extends Bloc<PokemonGetDetailsEvent, PokemonGetDetailsState> {
  final GetPokemonDetailsUsecase getDetailsPokemonUseCase;
  int pokemonId = 1;

  PokemonGetDetailsBloc({ required this.getDetailsPokemonUseCase, required this.pokemonId}) : super(PokemonInitial()) {
    on<FetchOnePokemonEvent>(_onPokemonFetched);
  }

  Future<void> _onPokemonFetched(
      FetchOnePokemonEvent event,
      Emitter<PokemonGetDetailsState> emit,
      ) async {
    try{
      if(state is PokemonInitial) {
        emit(PokemonLoading());
        final Either<PokeError, PokemonGetDetailsModel> eitherResult = await getDetailsPokemonUseCase(pokemonId);
        eitherResult.fold(
                (error) => emit(PokemonError(error.errorMessage)),
                (result) => emit(PokemonLoaded(pokemonDetails: result))
        );
      }

    }
    catch(e)
    {
      emit(PokemonError('Error inesperado: $e'));
    }
  }
}