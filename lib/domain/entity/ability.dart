
import 'package:equatable/equatable.dart';

class Abillity extends Equatable {
  final int id;
  final String abillityName;
  final String description;

  Abillity({
    required this.id,
    required this.abillityName,
    required this.description
});

  @override
  List<Object?> get props => [id, abillityName, description];

}