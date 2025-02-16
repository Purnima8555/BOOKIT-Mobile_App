// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreDTO _$ExploreDTOFromJson(Map<String, dynamic> json) => ExploreDTO(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ExploreApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExploreDTOToJson(ExploreDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
