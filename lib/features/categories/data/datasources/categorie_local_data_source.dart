import 'package:store/features/categories/data/models/categorie_model.dart';

abstract class CategorieLocalDataSource {
  /// Gets the cached [CategorieModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CategorieModel> getLastCategorie();

  Future<void> cacheCategorie(CategorieModel categorieToCache);
}
