import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/register_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';

// Mock classes
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  // Register fallback value for AuthEntity
  setUpAll(() {
    registerFallbackValue(AuthEntity(
      full_name: 'Test User',
      username: 'testuser',
      contact_no: '1234567890',
      email: 'testuser@example.com',
      password: 'password123',
      confirmPassword: 'password123',
    ));
  });

  late RegisterUseCase registerUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    registerUseCase = RegisterUseCase(mockAuthRepository);
  });

  group('RegisterUseCase', () {
    const tFullName = 'Test User';
    const tUsername = 'testuser';
    const tContactNo = '1234567890';
    const tEmail = 'testuser@example.com';
    const tPassword = 'password123';
    const tConfirmPassword = 'password123';

    test('should return responce when registration is successful', () async {
      // Arrange
      final authEntity = AuthEntity(
        full_name: tFullName,
        username: tUsername,
        contact_no: tContactNo,
        email: tEmail,
        password: tPassword,
        confirmPassword: tConfirmPassword,
      );

      when(() => mockAuthRepository.registerUser(authEntity))
          .thenAnswer((_) async => Right(null));

      // Act
      final result = await registerUseCase(RegisterUserParams(
        full_name: tFullName,
        username: tUsername,
        contact_no: tContactNo,
        email: tEmail,
        password: tPassword,
        confirmPassword: tConfirmPassword,
      ));

      // Assert
      expect(result, Right(null));
      verify(() => mockAuthRepository.registerUser(authEntity)).called(1);
    });

    test('should return failure when registration fails', () async {
      // Arrange
      final failure = ApiFailure(message: 'Registration failed');
      final authEntity = AuthEntity(
        full_name: tFullName,
        username: tUsername,
        contact_no: tContactNo,
        email: tEmail,
        password: tPassword,
        confirmPassword: tConfirmPassword,
      );

      when(() => mockAuthRepository.registerUser(authEntity))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await registerUseCase(RegisterUserParams(
        full_name: tFullName,
        username: tUsername,
        contact_no: tContactNo,
        email: tEmail,
        password: tPassword,
        confirmPassword: tConfirmPassword,
      ));

      // Assert
      expect(result, Left(failure));
      verify(() => mockAuthRepository.registerUser(authEntity)).called(1);
    });
  });
}
