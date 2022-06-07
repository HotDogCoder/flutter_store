import 'package:dartz/dartz.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/core/usecases/usecase.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';
import 'package:store/features/currencies/domain/repositories/abstract_currency_repository.dart';

class ShowCurrencyUseCase implements UseCase<Currency, String> {
  final AbstractCurrencyRepository repository;

  ShowCurrencyUseCase(this.repository);

  @override
  Future<Either<Failure, Currency>> call(String? id) async {
    return id != null
        ? await repository.showCurrency(id)
        : Left(NullParamFailure());
  }

  // @override
  // Future<Either<Failure, Currency>> call(Params params) async {
  //   // return await repository.showCurrency(params.id);
  // }
}

// class Params extends Equatable {
//   final String id;
//   // ignore: non_constant_identifier_names
//   Params({required String this.id}) : super();

//   @override
//   dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }
