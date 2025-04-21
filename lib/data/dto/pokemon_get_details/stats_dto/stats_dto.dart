

import 'package:json_annotation/json_annotation.dart';

part 'stats_dto.g.dart';

@JsonSerializable()
class StatsDTO {
  final int base_stat;
  final int effort;

  StatsDTO({required this.base_stat, required this.effort});

  factory StatsDTO.fromJson(Map<String, dynamic> json) =>
      _$StatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StatsDTOToJson(this);
}