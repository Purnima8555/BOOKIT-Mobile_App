import 'package:dartz/dartz.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';
import 'package:bookit_flutter_project/features/explore/domain/repository/explore_repository.dart';

class GetBooksByGenreUsecase implements UsecaseWithParams<List<ExploreEntity>, String> {
  final IExploreRepository _exploreRepository;

  GetBooksByGenreUsecase({required IExploreRepository exploreRepository})
      : _exploreRepository = exploreRepository;

  @override
  Future<Either<Failure, List<ExploreEntity>>> call(String genre) {
    return _exploreRepository.getByGenre(genre);
  }
}