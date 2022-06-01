import 'package:store/core/plataform/network_info.dart';
import 'package:store/core/error/failures.dart';
import 'package:dartz/dartz.dart';
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
  Future<Either<Failure, Currency>> showCurrency(
    String id,
  ) async {
    networkInfo.isConnected;
    return Right(await remoteDataSource.showCurrency(id));
  }
}
