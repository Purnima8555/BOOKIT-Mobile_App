// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeApiModel _$HomeApiModelFromJson(Map<String, dynamic> json) => HomeApiModel(
      bookId: json['_id'] as String?,
      image: json['image'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      hasDiscount: json['hasDiscount'] as bool,
      discountPercent: (json['discountPercent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HomeApiModelToJson(HomeApiModel instance) =>
    <String, dynamic>{
      '_id': instance.bookId,
      'image': instance.image,
      'author': instance.author,
      'title': instance.title,
      'price': instance.price,
      'hasDiscount': instance.hasDiscount,
      'discountPercent': instance.discountPercent,
    };
