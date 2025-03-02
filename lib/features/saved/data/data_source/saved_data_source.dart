import 'package:bookit_flutter_project/features/saved/domain/entity/saved_entity.dart';

abstract interface class ISavedDataSource {
  Future<List<SavedEntity>> getSavedBooks(String userId);
  Future<void> addSavedBook(String userId, String bookId);
  Future<void> removeSavedBook(String favoriteId);
}
