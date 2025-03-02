import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ISavedRepository {
  Future<Either<Failure, List<SavedEntity>>> getSavedBooks(String userId);
  Future<Either<Failure, void>> addSavedBook(String userId, String bookId);
  Future<Either<Failure, void>> removeSavedBook(String favoriteId);
}
