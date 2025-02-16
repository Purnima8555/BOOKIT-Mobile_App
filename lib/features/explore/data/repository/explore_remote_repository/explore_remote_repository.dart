import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/explore/data/datasource/explore_data_source.dart';
import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';
import 'package:bookit_flutter_project/features/explore/domain/repository/explore_repository.dart';
import 'package:dartz/dartz.dart';

class ExploreRemoteRepository implements IExploreRepository {
  final IExploreDataSource _exploreRemoteDataSource;

  ExploreRemoteRepository(this._exploreRemoteDataSource);

  @override
  Future<Either<Failure, List<ExploreEntity>>> getAllBooks() async {
    try {
      final books = await _exploreRemoteDataSource.getAllBooks();
      return Right(books);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ExploreEntity>>> getByGenre(String genre) async {
    try {
      final booksByGenre = await _exploreRemoteDataSource.getByGenre(genre);
      return Right(booksByGenre);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
