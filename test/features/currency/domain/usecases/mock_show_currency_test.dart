import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';
import 'package:dartz/dartz.dart';
import 'package:store/features/currencies/domain/repositories/abstract_currency_repository.dart';
import 'package:store/features/currencies/domain/usecases/show_currency.dart';

import '../../../../mocks/currency_entity_mock.dart';

class MockCurrencyRepository extends Mock
    implements AbstractCurrencyRepository {}

void main() {
  late ShowCurrencyUseCase usecase;
  late AbstractCurrencyRepository mockCurrencyRepository;
  setUp(() {
    mockCurrencyRepository = MockCurrencyRepository();
    usecase = ShowCurrencyUseCase(mockCurrencyRepository);
  });

  const String id = "1";

  test('should show a specific currency data : ', () async {
    // expect(mockShowCurrency.showCurrency(any()), []);

    when(() => mockCurrencyRepository.showCurrency(any()))
        .thenAnswer((_) async => Right<Failure, Currency>(currency));

    final result = await usecase(id);
    expect(result, Right(currency));
    verify(() => mockCurrencyRepository.showCurrency(id)).called(1);
  });

  test('should return a ServerFailure when don\'t succeed: ', () async {
    // expect(mockShowCurrency.showCurrency(any()), []);

    when(() => mockCurrencyRepository.showCurrency(any()))
        .thenAnswer((_) async => Left<Failure, Currency>(ServerFailure()));

    final result = await usecase(id);
    expect(result, Left(ServerFailure()));
    verify(() => mockCurrencyRepository.showCurrency(id)).called(1);
  });

  test('should return a NullParamFailure when receives a null param: ',
      () async {
    final result = await usecase(null);

    expect(result, Left(NullParamFailure()));
    verifyNever(() => mockCurrencyRepository.showCurrency(id));
  });
}
