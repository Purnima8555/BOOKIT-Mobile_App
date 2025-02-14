import 'package:bookit_flutter_project/features/home/domain/entity/home_entity.dart';

abstract interface class IHomeDataSource {
  Future<List<HomeEntity>> getAllBooks();

  Future<List<HomeEntity>> getNewBooks();

  Future<List<HomeEntity>> getBestBooks();
}
