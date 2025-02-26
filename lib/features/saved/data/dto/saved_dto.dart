import 'package:json_annotation/json_annotation.dart';
import 'package:bookit_flutter_project/features/saved/data/model/saved_api_model.dart';

part 'saved_dto.g.dart';

@JsonSerializable()
class SavedDTO {
  final bool success;
  final int count;
  final List<SavedApiModel> data;

  SavedDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory SavedDTO.fromJson(Map<String, dynamic> json) =>
      _$SavedDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SavedDTOToJson(this);
}
