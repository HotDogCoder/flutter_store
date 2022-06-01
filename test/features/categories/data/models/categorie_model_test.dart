import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:store/features/categories/data/models/categorie_model.dart';
import 'package:store/features/categories/domain/entities/categorie.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCategorieModel = CategorieModel(
      id_categorie: 1,
      description: 'Test Text',
      created_by: '2022-02-21',
      updated_by: '2022-02-21');

  test(
    'should be a subclass of Categorie entity',
    () async {
      expect(tCategorieModel, isA<Categorie>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON categorie is an integer',
      () async {
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('categorie.json'));

        final result = CategorieModel.fromJson(jsonMap);

        expect(result, tCategorieModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        final result = tCategorieModel.toJson();

        final expectedMap = {
          "id_categorie": 1,
          "description": "Test Text",
          "created_by": "2022-02-21",
          "updated_by": "2022-02-21"
        };

        expect(result, expectedMap);
      },
    );
  });
}
