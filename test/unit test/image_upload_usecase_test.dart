import 'dart:io';
import 'package:bookit_flutter_project/core/error/failure.dart';
import 'package:bookit_flutter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:bookit_flutter_project/features/auth/domain/use_case/upload_image_use_case.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';

// Mocking dependencies
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late UploadImageUsecase uploadImageUsecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    uploadImageUsecase = UploadImageUsecase(mockAuthRepository);
  });

  group('UploadImageUsecase', () {
    var tFile = File('path/to/file.png');
    const tImageUrl = 'https://example.com/path/to/image.png';

    test('should return image URL when image upload is successful', () async {
      // Arrange
      when(() => mockAuthRepository.uploadProfilePicture(tFile))
          .thenAnswer((_) async => Right(tImageUrl));

      // Act
      final result = await uploadImageUsecase(UploadImageParams(file: tFile));

      // Assert
      expect(result, Right(tImageUrl));
      verify(() => mockAuthRepository.uploadProfilePicture(tFile)).called(1);
    });

    test('should return failure when image upload fails', () async {
      // Arrange
      final failure = ApiFailure(message: 'Upload failed');
      when(() => mockAuthRepository.uploadProfilePicture(tFile))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await uploadImageUsecase(UploadImageParams(file: tFile));

      // Assert
      expect(result, Left(failure));
      verify(() => mockAuthRepository.uploadProfilePicture(tFile)).called(1);
    });
  });
}
