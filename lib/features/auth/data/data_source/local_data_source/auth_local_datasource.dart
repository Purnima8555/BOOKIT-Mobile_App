import 'dart:io';

import 'package:bookit_flutter_project/core/network/hive_service.dart';
import 'package:bookit_flutter_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:bookit_flutter_project/features/auth/data/model/auth_hive_model.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    // Return an empty AuthEntity as a default value
    return Future.value(const AuthEntity(
      userId: "1",
      full_name: "",
      username: "",
      contact_no: "",
      email: "",
      password: "",
      confirmPassword: "",
      address: null,
      image: null,
    ));
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      final user = await _hiveService.login(username, password);
      if (user == null) {
        return Future.error("Invalid credentials");
      }
      return Future.value("Success");
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel(
        userId: user.userId,
        full_name: user.full_name,
        username: user.username,
        contact_no: user.contact_no,
        email: user.email,
        password: user.password,
        confirmPassword: user.confirmPassword,
        address: user.address,
        image: user.image,
      );

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError("This method is not yet implemented");
  }
}
