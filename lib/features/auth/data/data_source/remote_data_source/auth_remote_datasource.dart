import 'dart:io';

import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';
import 'package:bookit_flutter_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:bookit_flutter_project/features/auth/data/model/auth_api_model.dart';
import 'package:bookit_flutter_project/features/auth/domain/entity/auth_enitity.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "full_name": user.full_name,
          "username": user.username,
          "contact_no": user.contact_no,
          "email": user.email,
          "password": user.password,
          "confirmPassword": user.confirmPassword,
          "address": user.address,
          "image": user.image,
        },
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "An error occurred");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<AuthEntity> getCurrentUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userId = prefs.getString('userId');
      final String? token = prefs.getString('token');

      print('🔍 Retrieved userId: $userId');
      print('🔍 Retrieved token: $token');

      if (userId == null || token == null) {
        throw Exception('User ID or token not found');
      }

      final Response response = await _dio.get(
        '${ApiEndpoints.getCurrentUser}/$userId',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        final data = AuthApiModel.fromJson(response.data);
        return data.toEntity();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "An error occurred");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        // ✅ Store token and userId
        await prefs.setString('token', response.data['token']);
        await prefs.setString('userId', response.data['userId']);
        await prefs.setString('username', response.data['username']);

        print('✅ Saved userId: ${response.data['userId']}');
        print('✅ Saved token: ${response.data['token']}');

        return response.data['token'];
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "An error occurred");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      // Ensure the file exists before proceeding
      if (!await file.exists()) {
        throw Exception('File does not exist at the provided path');
      }

      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path, filename: fileName),
      });

      // Sending the request
      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      print("Response: $response");

      if (response.statusCode == 200) {
        return response.data[
            'data']; // Assuming 'data' is the key containing the image filename
      } else {
        throw Exception('Error: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Dio specific error handling
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      // General error handling
      throw Exception('Unknown error: $e');
    }
  }
}
