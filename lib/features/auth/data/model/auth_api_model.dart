import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String full_name;
  final String username;
  final String contact_no;
  final String email;
  final String? password;
  final String? confirmPassword;
  final String? address;
  final String? image;

  const AuthApiModel({
    this.id,
    required this.full_name,
    required this.username,
    required this.contact_no,
    required this.email,
    this.password,
    this.confirmPassword,
    this.address,
    this.image,
  });

  /// Factory method to deserialize JSON into `AuthApiModel`
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  /// Method to serialize `AuthApiModel` into JSON
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  /// Convert API model to domain entity (`AuthEntity`)
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      full_name: full_name,
      username: username,
      contact_no: contact_no,
      email: email,
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
      address: address,
      image: image,
    );
  }

  /// Create `AuthApiModel` from `AuthEntity`
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      full_name: entity.full_name,
      username: entity.username,
      contact_no: entity.contact_no,
      email: entity.email,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
      address: entity.address,
      image: entity.image,
    );
  }

  @override
  List<Object?> get props => [
        id,
        full_name,
        username,
        contact_no,
        email,
        password,
        confirmPassword,
        address,
        image
      ];
}
