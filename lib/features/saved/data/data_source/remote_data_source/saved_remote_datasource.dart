import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';
import 'package:bookit_flutter_project/features/saved/data/data_source/saved_data_source.dart';
import 'package:bookit_flutter_project/features/saved/data/model/saved_api_model.dart';
import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedRemoteDataSource implements ISavedDataSource {
  final Dio _dio;

  SavedRemoteDataSource(this._dio);

  @override
  Future<List<SavedEntity>> getSavedBooks(String userId) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.getFavorites}$userId',
        options:
            Options(headers: {'Authorization': 'Bearer ${await _getToken()}'}),
      );
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((item) => SavedApiModel.fromJson(item).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception(e.response?.data ?? "An error occurred");
    } catch (e) {
      print('Exception: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addSavedBook(String userId, String bookId) async {
    try {
      final response = await _dio.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.addFavorite}',
        data: {'user_id': userId, 'book_id': bookId},
        options:
            Options(headers: {'Authorization': 'Bearer ${await _getToken()}'}),
      );
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode != 201) {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception(e.response?.data ?? "An error occurred");
    } catch (e) {
      print('Exception: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> removeSavedBook(String favoriteId) async {
    try {
      final response = await _dio.delete(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.removeFavorite}$favoriteId',
        options:
            Options(headers: {'Authorization': 'Bearer ${await _getToken()}'}),
      );
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode != 200) {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception(e.response?.data ?? "An error occurred");
    } catch (e) {
      print('Exception: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
