import 'dart:io';

import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';

abstract interface class IAuthDataSource {

  Future<String> loginUser(String username, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser();

  Future<String> uploadProfilePicture(File file);
}
