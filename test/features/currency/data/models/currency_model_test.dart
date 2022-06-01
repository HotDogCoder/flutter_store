import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final currencyModel = CurrencyModel(id: '1', msg: 'getCurrency');

  test(
    'should be a subclass of Currency entity',
    () async {
      expect(currencyModel, isA<Currency>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON categorie is an integer',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('currency.json'));

        final result = CurrencyModel.fromJson(jsonMap);

        expect(result, currencyModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = currencyModel.toJson();

        final expectedMap = {"id": "1", "msg": "getCurrency"};

        expect(result, expectedMap);
      },
    );
  });
}
