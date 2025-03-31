
abstract class PokeError {
  String get errorMessage;
}

class NetworkError extends PokeError {
  @override
  final String errorMessage = "Error al obtener la información inicial de todos los Pokemones";
}