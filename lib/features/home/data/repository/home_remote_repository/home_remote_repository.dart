import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/home/data/datasource/home_data_source.dart';
import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';
import 'package:bookit_flutter_project/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteRepository implements IHomeRepository {
  final IHomeDataSource _homeRemoteDataSource;

  HomeRemoteRepository(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllBooks() async {
    try {
      final books = await _homeRemoteDataSource.getAllBooks();
      return Right(books);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getNewBooks() async {
    try {
      final newBooks = await _homeRemoteDataSource.getNewBooks();
      return Right(newBooks);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<HomeEntity>>> getBestBooks() async {
    try {
      final bestBooks = await _homeRemoteDataSource.getBestBooks();
      return Right(bestBooks);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
