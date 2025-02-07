import 'package:bookit_flutter_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';

// Mocking dependencies
class MockAuthRepository extends Mock implements IAuthRepository {}

class MockTokenSharedPrefs extends Mock implements TokenSharedPrefs {}

void main() {
  late LoginUseCase loginUseCase;
  late MockAuthRepository mockAuthRepository;
  late MockTokenSharedPrefs mockTokenSharedPrefs;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockTokenSharedPrefs = MockTokenSharedPrefs();
    loginUseCase = LoginUseCase(mockAuthRepository, mockTokenSharedPrefs);
  });

  group('LoginUseCase', () {
    const tUsername = 'testuser';
    const tPassword = 'testpass';
    const tToken = 'valid_token';

    test('should return token when login is successful', () async {
      // Arrange
      when(() => mockAuthRepository.loginUser(tUsername, tPassword))
          .thenAnswer((_) async => Right(tToken));

      // Ensure that the saveToken method returns a successful result.
      when(() => mockTokenSharedPrefs.saveToken(tToken))
          .thenAnswer((_) async => Right(null)); // Fixed here

      // Mock the getToken to return a valid value.
      when(() => mockTokenSharedPrefs.getToken()).thenAnswer(
          (_) async => Right(tToken)); // Mock getToken to return the token

      // Act
      final result = await loginUseCase(
          LoginParams(username: tUsername, password: tPassword));

      // Assert
      expect(result, Right(tToken));
      verify(() => mockAuthRepository.loginUser(tUsername, tPassword))
          .called(1);
      verify(() => mockTokenSharedPrefs.saveToken(tToken)).called(1);
      verify(() => mockTokenSharedPrefs.getToken()).called(1);
    });

    test('should return failure when login fails', () async {
      // Arrange
      final failure = ApiFailure(message: 'Login failed');
      when(() => mockAuthRepository.loginUser(tUsername, tPassword))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await loginUseCase(
          LoginParams(username: tUsername, password: tPassword));

      // Assert
      expect(result, Left(failure));
      verify(() => mockAuthRepository.loginUser(tUsername, tPassword))
          .called(1);
    });
  });
}
