import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/core/usecases/usecase.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';
import 'package:store/features/categories/domain/repositories/abstract_categorie_repository.dart';

class ShowCategorieUseCase implements UseCase<Categorie, Params> {
  final AbstractCategorieRepository repository;

  ShowCategorieUseCase(this.repository);

  @override
  Future<Either<Failure, Categorie>> call(Params params) async {
    return await repository.showCategorie(params.id_categorie);
  }
}

class Params extends Equatable {
  final int id_categorie;
  // ignore: non_constant_identifier_names
  Params({required int this.id_categorie}) : super();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
