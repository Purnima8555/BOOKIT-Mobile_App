import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IExploreRepository {
  Future<Either<Failure, List<ExploreEntity>>> getAllBooks();

  Future<Either<Failure, List<ExploreEntity>>> getByGenre(String genre);
}
