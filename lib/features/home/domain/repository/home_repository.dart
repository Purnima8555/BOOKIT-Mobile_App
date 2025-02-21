import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IHomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getAllBooks();

  Future<Either<Failure, List<HomeEntity>>> getNewBooks();

  Future<Either<Failure, List<HomeEntity>>> getBestBooks();
}
