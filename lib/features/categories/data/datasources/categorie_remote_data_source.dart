import 'package:store/features/categories/data/models/categorie_model.dart';

abstract class CategorieRemoteDataSource {
  /// Calls the ttps://private-5bbbd-librolist.apiary-mock.com/categories/{id_categorie} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CategorieModel> showCategorie(int id_categorie);

  /// Calls the ttps://private-5bbbd-librolist.apiary-mock.com/categories endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CategorieModel> indexCategorie();
}
