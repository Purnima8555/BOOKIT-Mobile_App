import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({
    required this.username,
    required this.password,
  });

  // Initial Constructor
  const LoginParams.initial()
      : username = '',
        password = '';

  @override
  List<Object> get props => [username, password];
}

class LoginUseCase implements UsecaseWithParams<String, LoginParams> {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    // Call the repository to log in the user
    return repository.loginUser(params.username, params.password);
  }
}
