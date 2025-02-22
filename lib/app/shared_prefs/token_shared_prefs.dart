import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs(this._sharedPreferences);

  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _sharedPreferences.setString('token', token);
      return Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> saveUserData({
    required String token,
    required String userId,
    required String username,
  }) async {
    try {
      await _sharedPreferences.setString('token', token);
      await _sharedPreferences.setString('userId', userId);
      await _sharedPreferences.setString('username', username);
      return Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getToken() async {
    try {
      final token = _sharedPreferences.getString('token');
      return Right(token ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getUserId() async {
    try {
      final userId = _sharedPreferences.getString('userId');
      return Right(userId ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getUsername() async {
    try {
      final username = _sharedPreferences.getString('username');
      return Right(username ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<void> clearUserData() async {
    await _sharedPreferences.remove('token');
    await _sharedPreferences.remove('userId');
    await _sharedPreferences.remove('username');
  }
}
