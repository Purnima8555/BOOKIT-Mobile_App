import 'package:dartz/dartz.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';
import 'package:bookit_flutter_project/features/home/domain/repository/home_repository.dart';

class GetAllBooksUsecase implements UsecaseWithoutParams<List<HomeEntity>> {
  final IHomeRepository _homeRepository;

  GetAllBooksUsecase({required IHomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<HomeEntity>>> call() {
    return _homeRepository.getAllBooks();
  }
}
