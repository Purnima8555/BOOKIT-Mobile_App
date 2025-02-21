import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';
import 'package:bookit_flutter_project/features/explore/data/datasource/explore_data_source.dart';
import 'package:bookit_flutter_project/features/explore/data/model/explore_api_model.dart';
import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';
import 'package:dio/dio.dart';

class ExploreRemoteDataSource implements IExploreDataSource {
  final Dio _dio;

  ExploreRemoteDataSource(this._dio);

  @override
  Future<List<ExploreEntity>> getAllBooks() async {
    try {
      final response =
          await _dio.get('${ApiEndpoints.baseUrl}${ApiEndpoints.getAllBooks}');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((item) => ExploreApiModel.fromJson(item).toEntity())
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
  Future<List<ExploreEntity>> getByGenre(String genre) async {
    try {
      final genreEncoded = Uri.encodeComponent(
          genre); // Encode the genre to handle special characters
      final url =
          '${ApiEndpoints.baseUrl}${ApiEndpoints.getBooksByGenre}/$genreEncoded';
      final response = await _dio.get(url);
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((item) => ExploreApiModel.fromJson(item).toEntity())
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
}
