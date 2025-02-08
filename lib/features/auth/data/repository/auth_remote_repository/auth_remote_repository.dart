import 'dart:io';

import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/auth/data/data_source/remote_data_source/auth_remote_datasource.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      await _authRemoteDataSource.registerUser(user);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final user = await _authRemoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginUser(
      String username, String password) async {
    try {
      final token = await _authRemoteDataSource.loginUser(username, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    print("file, $file");
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      print(file);
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
