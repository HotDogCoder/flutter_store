import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/core/error/exceptions.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/core/network/network_info.dart';
import 'package:store/features/currencies/data/datasources/currency_local_data_source.dart';
import 'package:store/features/currencies/data/datasources/currency_remote_data_source.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';
import 'package:store/features/currencies/data/repositories/currency_repository_impl.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';

class MockRemoteDataSource extends Mock implements CurrencyRemoteDataSource {}

// class MockLocalDataSource extends Mock implements CurrencyLocalDataSource {}

// class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late CurrencyRepositoryImpl repositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repositoryImpl = CurrencyRepositoryImpl(mockRemoteDataSource);
  });

  const String id = "1";
  final currencyModel = CurrencyModel(id: '1', msg: 'getCurrency');

  test('should return space media model when calls the datasource', () async {
    when(() => mockRemoteDataSource.showCurrency(id))
        .thenAnswer((_) async => currencyModel);

    final result = await repositoryImpl.showCurrency(id);

    expect(result, Right(currencyModel));
    verify(() => mockRemoteDataSource.showCurrency(id));
  });

  test(
      'should return a server failure when calls the datasource is unsuccessful',
      () async {
    when(() => mockRemoteDataSource.showCurrency(id))
        .thenThrow(ServerException());

    final result = await repositoryImpl.showCurrency(id);

    expect(result, Left(ServerFailure()));
    verify(() => mockRemoteDataSource.showCurrency(id));
  });
}
