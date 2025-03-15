class PokemonDto {
  final String name;
  final String url;

  PokemonDto({required this.name, required this.url});

  // Factory constructor para crear un objeto desde JSON
  factory PokemonDto.fromJson(Map<String, dynamic> json) {
    return PokemonDto(
      name: json['name'],
      url: json['url'],
    );
  }
}