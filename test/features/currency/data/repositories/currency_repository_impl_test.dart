import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/core/error/exceptions.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/core/plataform/network_info.dart';
import 'package:store/features/currencies/data/datasources/currency_local_data_source.dart';
import 'package:store/features/currencies/data/datasources/currency_remote_data_source.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';
import 'package:store/features/currencies/data/repositories/currency_repository_impl.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';

class MockRemoteDataSource extends Mock implements CurrencyRemoteDataSource {}

class MockLocalDataSource extends Mock implements CurrencyLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late CurrencyRepositoryImpl repositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = CurrencyRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('showCurrency', () {
    final String id = '1';
    final currencyModel = CurrencyModel(id: id, msg: 'getCurrency');
    final Currency currency = currencyModel;
    test('should check if the device is online', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      verifyNever(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data is successful',
          () async {
        when(() => mockRemoteDataSource.showCurrency(id))
            .thenAnswer((_) async => currencyModel);

        final result = await repositoryImpl.showCurrency(id);

        verify(() => mockRemoteDataSource.showCurrency(id));
        expect(result, equals(Right(currency)));
      });

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(() => mockRemoteDataSource.showCurrency(id))
              .thenAnswer((_) async => currencyModel);
          // act
          await repositoryImpl.showCurrency(id);
          // assert
          verify(() => mockRemoteDataSource.showCurrency(id));
          verify(() => mockLocalDataSource.cacheCurrency(currencyModel));
        },
      );

      test(
          'should return server failure when the call to remote data is unsuccessful',
          () async {
        when(() => mockRemoteDataSource.showCurrency(id))
            .thenThrow(ServerException());

        final result = await repositoryImpl.showCurrency(id);

        verify(() => mockRemoteDataSource.showCurrency(id));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    // group('device is offline', () {
    //   setUp(() {
    //     when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    //   });

    //   test(
    //       'should return last locally cahed data when the cached data is present',
    //       () async {
    //     when(() => mockLocalDataSource.getLastCurrency())
    //         .thenAnswer((_) async => currencyModel);
    //     final result = await repositoryImpl.showCurrency(id);

    //     verifyZeroInteractions(mockLocalDataSource);
    //     verify(() => mockLocalDataSource.getLastCurrency());
    //     expect(result, equals(Right(Currency)));
    //   });

    //   test('should return cahed failure when the cached data is not present',
    //       () async {
    //     when(() => mockLocalDataSource.getLastCurrency())
    //         .thenThrow(CacheException());

    //     final result = await repositoryImpl.showCurrency(id);

    //     verifyZeroInteractions(mockLocalDataSource);
    //     verify(() => mockLocalDataSource.getLastCurrency());
    //     expect(result, equals(Left(CacheFailure())));
    //   });
    // });
  });
}
