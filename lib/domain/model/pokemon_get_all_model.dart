
import 'package:equatable/equatable.dart';

class PokemonGetAllModel extends Equatable{
  final int id;
  final String name;
  final String urlDetails;
  final String urlImage;

  PokemonGetAllModel({
    required this.id,
    required this.name,
    required this.urlDetails,
    required this.urlImage
  });

  @override
  List<Object?> get props => [ id, name, urlDetails, urlImage];
}