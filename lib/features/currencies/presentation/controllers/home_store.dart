import 'package:flutter_triple/flutter_triple.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';
import 'package:store/features/currencies/domain/usecases/show_currency.dart';

class HomeStore extends NotifierStore<Failure, Currency> {
  final ShowCurrencyUseCase usecase;

  HomeStore(this.usecase) : super(Currency(id: '', msg: ''));

  showCurrency(String id) async {
    setLoading(true);
    final result = await usecase(id);
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
