
import 'package:equatable/equatable.dart';

class AbillityModel extends Equatable{
  final int id;
  final String name;
  final String description;
  final int slot;
  final bool isHidden;

  AbillityModel({
    required this.id,
    required this.name,
    required this.description,
    required this.slot,
    required this.isHidden
  });

  @override
  List<Object?> get props => [ id, name, description, slot, isHidden ];
}