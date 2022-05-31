import 'package:dartz/dartz.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';

abstract class AbstractCategorieRepository {
  Future<Either<Failure, Categorie>> showCategorie(int number);
  Future<Either<Failure, Categorie>> indexCategorie(int number);
}