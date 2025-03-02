import 'package:dartz/dartz.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';
import 'package:bookit_flutter_project/features/saved/domain/repository/saved_repository.dart';

class GetSavedBooksUseCase
    implements UsecaseWithParams<List<SavedEntity>, String> {
  final ISavedRepository _savedRepository;

  GetSavedBooksUseCase({required ISavedRepository savedRepository})
      : _savedRepository = savedRepository;

  @override
  Future<Either<Failure, List<SavedEntity>>> call(String userId) {
    return _savedRepository.getSavedBooks(userId);
  }
}
