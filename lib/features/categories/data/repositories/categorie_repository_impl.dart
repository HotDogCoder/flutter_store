import 'package:store/core/plataform/network_info.dart';
import 'package:store/features/categories/data/datasources/categorie_local_data_source.dart';
import 'package:store/features/categories/data/datasources/categorie_remote_data_source.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';
import 'package:store/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:store/features/categories/domain/repositories/abstract_categorie_repository.dart';

class CategorieRepositoryImpl implements AbstractCategorieRepository {
  final CategorieRemoteDataSource remoteDataSource;
  final CategorieLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CategorieRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Categorie>> indexCategorie() {
    return throw Exception();
  }

  @override
  Future<Either<Failure, Categorie>> showCategorie(
    int id_categorie,
  ) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.showCategorie(id_categorie));
  }
}
