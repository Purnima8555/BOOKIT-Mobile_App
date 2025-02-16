// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreApiModel _$ExploreApiModelFromJson(Map<String, dynamic> json) =>
    ExploreApiModel(
      bookId: json['_id'] as String?,
      image: json['image'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ExploreApiModelToJson(ExploreApiModel instance) =>
    <String, dynamic>{
      '_id': instance.bookId,
      'image': instance.image,
      'author': instance.author,
      'title': instance.title,
      'price': instance.price,
    };
