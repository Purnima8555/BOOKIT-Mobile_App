import 'package:dartz/dartz.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/saved/domain/repository/saved_repository.dart';

class RemoveSavedBookUseCase implements UsecaseWithParams<void, String> {
  final ISavedRepository _savedRepository;

  RemoveSavedBookUseCase({required ISavedRepository savedRepository})
      : _savedRepository = savedRepository;

  @override
  Future<Either<Failure, void>> call(String favoriteId) {
    return _savedRepository.removeSavedBook(favoriteId);
  }
}
