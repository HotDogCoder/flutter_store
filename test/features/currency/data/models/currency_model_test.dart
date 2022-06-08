import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';
import '../../../../mocks/currency_mock.dart';

void main() {
  final currencyModel = CurrencyModel(id: '1', msg: 'getCurrency');

  test(
    'should be a subclass of Currency entity',
    () async {
      expect(currencyModel, isA<Currency>());
    },
  );

  test('should return a valid model', () async {
    final Map<String, dynamic> jsonMap = json.decode(currencyMock);

    final result = CurrencyModel.fromJson(jsonMap);

    expect(result, currencyModel);
  });

  test('should return a JSON map containing the proper data', () async {
    final result = currencyModel.toJson();

    final expectedMap = {"id": "1", "msg": "getCurrency"};

    expect(result, expectedMap);
  });
}
