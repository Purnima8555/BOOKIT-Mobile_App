import 'package:bookit_flutter_project/app/constants/hive_table_constant.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId; // Unique identifier
  @HiveField(1)
  final String full_name;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String contact_no;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String password;
  @HiveField(6)
  final String confirmPassword;
  @HiveField(7)
  final String? address; // Optional
  @HiveField(8)
  final String? image; // Optional

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.full_name,
    required this.username,
    required this.contact_no,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.address,
    this.image,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        full_name = '',
        username = '',
        contact_no = '',
        email = '',
        password = '',
        confirmPassword = '',
        address = null,
        image = null;

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
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

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      full_name: full_name,
      username: username,
      contact_no: contact_no,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      address: address,
      image: image,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        full_name,
        username,
        contact_no,
        email,
        password,
        confirmPassword,
        address,
        image,
      ];
}
