import 'package:bookit_flutter_project/features/explore/domain/entity/explore_entity.dart';

abstract interface class IExploreDataSource {
  Future<List<ExploreEntity>> getAllBooks();

  Future<List<ExploreEntity>> getByGenre(String genre);
}
