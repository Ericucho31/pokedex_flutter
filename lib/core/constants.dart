
import 'package:graphql/client.dart';

const String baseUrl = "https://pokeapi.co/api/v2";
const String officialArtworkUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/";

HttpLink graphQlLink = HttpLink(
    'https://beta.pokeapi.co/graphql/v1beta'
);