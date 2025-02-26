// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedDTO _$SavedDTOFromJson(Map<String, dynamic> json) => SavedDTO(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => SavedApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SavedDTOToJson(SavedDTO instance) => <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
