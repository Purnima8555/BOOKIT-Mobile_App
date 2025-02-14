import 'package:bookit_flutter_project/app/constants/api_endpoints.dart';
import 'package:bookit_flutter_project/features/home/data/datasource/home_data_source.dart';
import 'package:bookit_flutter_project/features/home/data/model/home_api_model.dart';
import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSource implements IHomeDataSource {
  final Dio _dio;

  HomeRemoteDataSource(this._dio);

  @override
  Future<List<HomeEntity>> getAllBooks() async {
    try {
      final response =
          await _dio.get('${ApiEndpoints.baseUrl}${ApiEndpoints.getAllBooks}');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((item) => HomeApiModel.fromJson(item).toEntity())
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
  Future<List<HomeEntity>> getNewBooks() async {
    try {
      final response =
          await _dio.get('${ApiEndpoints.baseUrl}${ApiEndpoints.getNewBooks}');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((item) => HomeApiModel.fromJson(item).toEntity())
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
  Future<List<HomeEntity>> getBestBooks() async {
    try {
      final response =
          await _dio.get('${ApiEndpoints.baseUrl}${ApiEndpoints.getBestBooks}');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data
            .map((item) => HomeApiModel.fromJson(item).toEntity())
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
