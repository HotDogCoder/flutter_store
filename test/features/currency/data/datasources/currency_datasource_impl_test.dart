import 'dart:ffi';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/core/error/exceptions.dart';
import 'package:store/features/currencies/data/datasources/currency_remote_data_source.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';

import '../../../../mocks/currency_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late CurrencyRemoteDataSource dataSource;
  late HttpClient client;

  setUp(() {
    // client = HttpClientMock();
    // dataSource = CurrencyDataSourceImpl(client);
  });

  // const String id = "1";
  // const urlExpected = 'http://localhost:8000/api/currency/1';

  // void successMock() {
  //   when(() => client.get(any())).thenAnswer(
  //       (_) async => HttpResponse(data: currencyMock, statusCode: 200));
  // }

  // test('should call the get method with correct url', () async {
  //   successMock();

  //   await dataSource.showCurrency(id);

  //   verify(() => client.get(urlExpected)).called(1);
  // });

  // test('should return a CurrencyModel when is successful', () async {
  //   successMock();
  //   final currencyModelExpected = CurrencyModel(id: '1', msg: 'getCurrency');
  //   final result = await dataSource.showCurrency(id);

  //   expect(result, currencyModelExpected);
  // });

  // test('should throw a ServerException when the call is unsuccessful',
  //     () async {
  //   when(() => client.get(any())).thenAnswer((_) async =>
  //       HttpResponse(data: 'something went wrong', statusCode: 500));

  //   final result = dataSource.showCurrency(id);

  //   expect(() => result, throwsA(ServerException()));
  // });
}
