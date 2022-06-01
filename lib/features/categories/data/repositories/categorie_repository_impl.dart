import 'package:store/features/categories/domain/entities/categorie.dart';
import 'package:store/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:store/features/categories/domain/repositories/abstract_categorie_repository.dart';

class CategorieRepositoryImpl implements AbstractCategorieRepository {
  @override
  Future<Either<Failure, Categorie>> indexCategorie() {
    // TODO: implement indexCategorie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Categorie>> showCategorie(int id_categorie) {
    // TODO: implement showCategorie
    throw UnimplementedError();
  }
}
