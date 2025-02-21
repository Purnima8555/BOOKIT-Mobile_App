import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';
import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';

part 'explore_api_model.g.dart';

@JsonSerializable()
class ExploreApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? bookId;
  final String image;
  final String author;
  final String title;
  final double price;

  const ExploreApiModel({
    this.bookId,
    required this.image,
    required this.author,
    required this.title,
    required this.price,
  });

  factory ExploreApiModel.fromJson(Map<String, dynamic> json) =>
      _$ExploreApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExploreApiModelToJson(this);

  // From Entity
  factory ExploreApiModel.fromEntity(ExploreEntity entity) {
    return ExploreApiModel(
      bookId: entity.bookId,
      image: entity.image,
      author: entity.author,
      title: entity.title,
      price: entity.price,
    );
  }

  // To Entity
  ExploreEntity toEntity() {
    return ExploreEntity(
      bookId: bookId,
      image: ApiEndpoints.bookImageUrl + image,
      author: author,
      title: title,
      price: price,
    );
  }

  // To Entity List
  static List<ExploreEntity> toEntityList(List<ExploreApiModel> modelList) {
    return modelList.map((model) => model.toEntity()).toList();
  }

  // From Entity List
  static List<ExploreApiModel> fromEntityList(List<ExploreEntity> entityList) {
    return entityList
        .map((entity) => ExploreApiModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        bookId,
        image,
        author,
        title,
        price,
      ];
}
