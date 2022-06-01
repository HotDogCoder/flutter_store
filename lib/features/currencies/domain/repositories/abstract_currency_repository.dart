import 'package:dartz/dartz.dart';
import 'package:store/core/error/failures.dart';
import 'package:store/features/currencies/domain/entities/currency.dart';

abstract class AbstractCurrencyRepository {
  Future<Either<Failure, Currency>> showCurrency(String id);
}
