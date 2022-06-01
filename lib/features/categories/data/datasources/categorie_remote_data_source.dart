import 'package:store/features/categories/data/models/categorie_model.dart';

abstract class CategorieRemoteDataSource {
  /// Calls the https://private-5bbbd-librolist.apiary-mock.com/categories endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CategorieModel> showCategorie(int id_categorie);

  /// Calls the https://private-5bbbd-librolist.apiary-mock.com/categories endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CategorieModel> indexCategorie();
}
