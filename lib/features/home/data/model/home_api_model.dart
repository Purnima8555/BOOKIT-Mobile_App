import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';
import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';

part 'home_api_model.g.dart';

@JsonSerializable()
class HomeApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? bookId;
  final String image;
  final String author;
  final String title;
  final double price;
  final bool hasDiscount;
  @JsonKey(name: 'discount_percent')
  final double? discountPercent;

  const HomeApiModel({
    this.bookId,
    required this.image,
    required this.author,
    required this.title,
    required this.price,
    required this.hasDiscount,
    this.discountPercent,
  });

  factory HomeApiModel.fromJson(Map<String, dynamic> json) =>
      _$HomeApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeApiModelToJson(this);

  // From Entity
  factory HomeApiModel.fromEntity(HomeEntity entity) {
    return HomeApiModel(
      bookId: entity.bookId,
      image: entity.image,
      author: entity.author,
      title: entity.title,
      price: entity.price,
      hasDiscount: entity.hasDiscount,
      discountPercent: entity.discountPercent,
    );
  }

  // To Entity
  HomeEntity toEntity() {
    return HomeEntity(
      bookId: bookId,
      image: ApiEndpoints.bookImageUrl + image,
      author: author,
      title: title,
      price: price,
      hasDiscount: hasDiscount,
      discountPercent: discountPercent,
    );
  }

  // To Entity List
  static List<HomeEntity> toEntityList(List<HomeApiModel> modelList) {
    return modelList.map((model) => model.toEntity()).toList();
  }

  // From Entity List
  static List<HomeApiModel> fromEntityList(List<HomeEntity> entityList) {
    return entityList.map((entity) => HomeApiModel.fromEntity(entity)).toList();
  }

  @override
  List<Object?> get props => [
        bookId,
        image,
        author,
        title,
        price,
        hasDiscount,
        discountPercent,
      ];
}
