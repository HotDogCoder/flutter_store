import 'package:dartz/dartz.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';
import 'package:store/features/categories/domain/repositories/abstract_categorie_repository.dart';

class ShowCategorieUseCase {
  final AbstractCategorieRepository repository;

  ShowCategorieUseCase(this.repository);

  Future<Either<Failure,Categorie>> call({
    required int id_categorie
  }) async {
    return await repository.showCategorie(id_categorie);
  }
} 