import 'package:bookit_flutter_project/features/home/data/model/home_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDTO {
  final bool success;
  final int count;
  final List<HomeApiModel> data;

  HomeDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory HomeDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDTOToJson(this);
}
