import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';
import 'package:dartz/dartz.dart';
import 'package:store/features/currencies/domain/repositories/abstract_currency_repository.dart';
import 'package:store/features/currencies/domain/usecases/show_currency.dart';

class MockCurrencyRepository extends Mock
    implements AbstractCurrencyRepository {}

void main() {
  late ShowCurrencyUseCase usecase;
  late MockCurrencyRepository mockCurrencyRepository;
  setUp(() {
    mockCurrencyRepository = MockCurrencyRepository();
    usecase = ShowCurrencyUseCase(mockCurrencyRepository);
  });

  const String id = "1";
  final Currency currency = Currency(id: '1', msg: 'getCurrency');

  test('should show a specific currency data : ', () async {
    // expect(mockShowCurrency.showCurrency(any()), []);
    when(() => mockCurrencyRepository.showCurrency(any()))
        .thenAnswer((_) async => Right(currency));

    final result = await usecase(Params(id: id));

    expect(result, Right(currency));
    verify(() => mockCurrencyRepository.showCurrency(id));
    verifyNoMoreInteractions(mockCurrencyRepository);
  });
}
