// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsDTO _$StatsDTOFromJson(Map<String, dynamic> json) => StatsDTO(
  base_stat: (json['base_stat'] as num).toInt(),
  effort: (json['effort'] as num).toInt(),
);

Map<String, dynamic> _$StatsDTOToJson(StatsDTO instance) => <String, dynamic>{
  'base_stat': instance.base_stat,
  'effort': instance.effort,
};
