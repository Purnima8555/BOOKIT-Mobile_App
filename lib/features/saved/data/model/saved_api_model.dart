import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';
import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';

part 'saved_api_model.g.dart';

@JsonSerializable()
class SavedApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String favoriteId;
  @JsonKey(name: 'book_id')
  final Map<String, dynamic> book;

  const SavedApiModel({
    required this.favoriteId,
    required this.book,
  });

  factory SavedApiModel.fromJson(Map<String, dynamic> json) =>
      _$SavedApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$SavedApiModelToJson(this);

  factory SavedApiModel.fromEntity(SavedEntity entity) {
    return SavedApiModel(
      favoriteId: entity.favoriteId,
      book: {
        '_id': entity.bookId,
        'image': entity.image.replaceFirst(ApiEndpoints.bookImageUrl, ''),
        'author': entity.author,
        'title': entity.title,
        'price': entity.price,
        'availability_status': entity.availabilityStatus,
      },
    );
  }

  SavedEntity toEntity() {
    return SavedEntity(
      favoriteId: favoriteId,
      bookId: book['_id'] as String,
      image: ApiEndpoints.bookImageUrl + (book['image'] as String),
      author: book['author'] as String,
      title: book['title'] as String,
      price: (book['price'] as num).toDouble(),
      availabilityStatus: book['availability_status'] as String,
    );
  }

  static List<SavedEntity> toEntityList(List<SavedApiModel> modelList) {
    return modelList.map((model) => model.toEntity()).toList();
  }

  static List<SavedApiModel> fromEntityList(List<SavedEntity> entityList) {
    return entityList
        .map((entity) => SavedApiModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [favoriteId, book];
}
