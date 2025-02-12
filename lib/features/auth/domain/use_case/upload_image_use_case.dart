import 'dart:io';

import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUsecase
    implements UsecaseWithParams<String, UploadImageParams> {
  final IAuthRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    print(params.file);
    return _repository.uploadProfilePicture(params.file);
  }
}
