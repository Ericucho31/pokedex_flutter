
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/core/errors.dart';
import 'package:flutter_pokedex/data/model/pokemon_get_all_model.dart';
import 'package:flutter_pokedex/domain/use_cases/get_all_pokemon_useCase.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_event.dart';
import 'package:flutter_pokedex/presentation/bloc/pokemon_get_all_bloc/pokemon_get_all_state.dart';
import 'package:fpdart/src/either.dart';

class PokemonGetAllBloc extends Bloc<PokemonGetAllEvent, PokemonGetAllState> {
  final GetAllPokemonUseCase getAllPokemonUseCase;
  final int _limit = 151;
  int _offset = 0;

  PokemonGetAllBloc({ required this.getAllPokemonUseCase}) : super(PokemonInitial()) {
    on<FetchAllPokemonEvent>(_onPokemonFetched);
  }

  Future<void> _onPokemonFetched(
      FetchAllPokemonEvent event,
      Emitter<PokemonGetAllState> emit,
  ) async {
    try{
      if(state is PokemonInitial) {
        emit(PokemonLoading());
        final Either<PokeError, List<PokemonGetAllModel>> eitherResult = await getAllPokemonUseCase( limit: _limit, offset: _offset);
        _offset += _limit;
        eitherResult.fold(
            (error) => emit(PokemonError(error.errorMessage)),
            (result) => emit(PokemonLoaded(pokemons: result))
        );
      }

    }
    catch(e)
    {
      emit(PokemonError('Error inesperado: $e'));
    }
  }
}