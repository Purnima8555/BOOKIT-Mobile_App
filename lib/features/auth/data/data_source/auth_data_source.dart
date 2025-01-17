import 'dart:io';

import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';

abstract interface class IAuthDataSource {
  /// Logs in a user using their username and password.
  /// Returns the userId if login is successful.
  Future<String> loginUser(String username, String password);

  /// Registers a new user with the provided AuthEntity details.
  Future<void> registerUser(AuthEntity user);

  /// Retrieves the current logged-in user's details as an AuthEntity.
  Future<AuthEntity> getCurrentUser();

  /// Uploads a profile picture and returns the URL of the uploaded image.
  Future<String> uploadProfilePicture(File file);
}
