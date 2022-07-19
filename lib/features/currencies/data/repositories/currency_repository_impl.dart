import 'package:store/core/error/exceptions.dart';
import 'package:store/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:store/core/network/network_info.dart';
import 'package:store/features/currencies/data/datasources/currency_local_data_source.dart';
import 'package:store/features/currencies/data/datasources/currency_remote_data_source.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';
import 'package:store/features/currencies/domain/repositories/abstract_currency_repository.dart';

class CurrencyRepositoryImpl implements AbstractCurrencyRepository {
  final CurrencyRemoteDataSource remoteDataSource;
  final CurrencyLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CurrencyRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Currency>> showCurrency(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCurrency = await remoteDataSource.showCurrency(id);
        localDataSource.cacheCurrency(remoteCurrency);
        return Right(remoteCurrency);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCurrency = await localDataSource.getLastCurrency(id);
        return Right(localCurrency);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  // @override
  // Future<Either<Failure, Currency>> showCurrency(String id) async {
  //   try {
  //     final result = await remoteDataSource.showCurrency(id);
  //     return Right(result);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }
}
