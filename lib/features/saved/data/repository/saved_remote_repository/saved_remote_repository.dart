import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/saved/data/data_source/saved_data_source.dart';
import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';
import 'package:bookit_flutter_project/features/saved/domain/repository/saved_repository.dart';
import 'package:dartz/dartz.dart';

class SavedRemoteRepository implements ISavedRepository {
  final ISavedDataSource _savedRemoteDataSource;

  SavedRemoteRepository(this._savedRemoteDataSource);

  @override
  Future<Either<Failure, List<SavedEntity>>> getSavedBooks(
      String userId) async {
    try {
      final savedBooks = await _savedRemoteDataSource.getSavedBooks(userId);
      return Right(savedBooks);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addSavedBook(
      String userId, String bookId) async {
    try {
      await _savedRemoteDataSource.addSavedBook(userId, bookId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeSavedBook(String favoriteId) async {
    try {
      await _savedRemoteDataSource.removeSavedBook(favoriteId);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
