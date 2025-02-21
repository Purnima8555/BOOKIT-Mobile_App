// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDTO _$HomeDTOFromJson(Map<String, dynamic> json) => HomeDTO(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => HomeApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDTOToJson(HomeDTO instance) => <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
