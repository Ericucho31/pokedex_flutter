
import 'dart:ui';

import 'package:equatable/equatable.dart';

class TypeModel extends Equatable{
  final int id;
  final String name;
  final Color color;
  final int slot;


  TypeModel({
    required this.id,
    required this.name,
    required this.color,
    required this.slot
  });

  @override
  List<Object?> get props => [ id, name, color ];
}