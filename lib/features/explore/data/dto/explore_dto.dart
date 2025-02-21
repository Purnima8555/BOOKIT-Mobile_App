import 'package:bookit_flutter_project/features/explore/data/model/explore_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'explore_dto.g.dart';

@JsonSerializable()
class ExploreDTO {
  final bool success;
  final int count;
  final List<ExploreApiModel> data;

  ExploreDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory ExploreDTO.fromJson(Map<String, dynamic> json) =>
      _$ExploreDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExploreDTOToJson(this);
}
