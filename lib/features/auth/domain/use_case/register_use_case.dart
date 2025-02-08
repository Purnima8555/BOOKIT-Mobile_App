import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/app/usecase/usecase.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String full_name;
  final String username;
  final String contact_no;
  final String email;
  final String password;
  final String confirmPassword;
  final String? address;
  final String? image;

  const RegisterUserParams({
    required this.full_name,
    required this.username,
    required this.contact_no,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.address,
    this.image,
  });

  // Initial constructor
  const RegisterUserParams.initial({
    required this.full_name,
    required this.username,
    required this.contact_no,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.address,
    this.image,
  });

  @override
  List<Object?> get props => [
        full_name,
        username,
        contact_no,
        email,
        password,
        confirmPassword,
        address
      ];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      full_name: params.full_name,
      username: params.username,
      contact_no: params.contact_no,
      email: params.email,
      password: params.password,
      confirmPassword: params.confirmPassword,
      address: params.address,
      image: params.image,
    );
    print("$authEntity, auth");

    return repository.registerUser(authEntity);
  }
}
