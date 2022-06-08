import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/features/currencies/domain/usecases/show_currency.dart';
import 'package:store/features/currencies/presentation/controllers/home_store.dart';
import 'package:store/screens/home_screen.dart';

import '../../../../mocks/currency_entity_mock.dart';

class MockShowCurrencyUseCase extends Mock implements ShowCurrencyUseCase {}

void main() {
  // late HomeStore store;
  // late ShowCurrencyUseCase mockusecase;

  // setUp(() {
  //   mockusecase = MockShowCurrencyUseCase();
  //   store = HomeStore(mockusecase);
  // });

  // const String id = "1";

  // test('should return a Currency from the usecase', () async {
  //   when(() => mockusecase(any())).thenAnswer((_) async => Right(currency));

  //   await store.showCurrency(id);

  //   store.observer(onState: (state) {
  //     expect(state, currency);
  //     verify(() => mockusecase(id)).called(1);
  //   });
  // });

  // test('should return a Failure from the usecase when there is an error',
  //     () async {
  //   when(() => mockusecase(any()))
  //       .thenAnswer((_) async => Left(ServerFailure()));

  //   await store.showCurrency(id);

  //   store.observer(onError: (error) {
  //     expect(error, ServerFailure());
  //     verify(() => mockusecase(id)).called(1);
  //   });
  // });
}
