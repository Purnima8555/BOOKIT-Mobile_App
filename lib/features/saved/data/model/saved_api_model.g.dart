// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedApiModel _$SavedApiModelFromJson(Map<String, dynamic> json) =>
    SavedApiModel(
      favoriteId: json['_id'] as String,
      book: json['book_id'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SavedApiModelToJson(SavedApiModel instance) =>
    <String, dynamic>{
      '_id': instance.favoriteId,
      'book_id': instance.book,
    };
