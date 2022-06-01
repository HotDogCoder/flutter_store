import 'package:store/features/currencies/data/models/currency_model.dart';

abstract class CurrencyRemoteDataSource {
  /// Calls the http://localhost:8000/api/currency/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CurrencyModel> showCurrency(String id);
}
