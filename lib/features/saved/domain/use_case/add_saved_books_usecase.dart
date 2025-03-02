import 'package:dartz/dartz.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/saved/domain/repository/saved_repository.dart';

class AddSavedBookUseCase
    implements UsecaseWithParams<void, AddSavedBookParams> {
  final ISavedRepository _savedRepository;

  AddSavedBookUseCase({required ISavedRepository savedRepository})
      : _savedRepository = savedRepository;

  @override
  Future<Either<Failure, void>> call(AddSavedBookParams params) {
    return _savedRepository.addSavedBook(params.userId, params.bookId);
  }
}

class AddSavedBookParams {
  final String userId;
  final String bookId;

  AddSavedBookParams({required this.userId, required this.bookId});
}
