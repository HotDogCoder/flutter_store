import 'package:store/features/currencies/data/models/currency_model.dart';

abstract class CurrencyLocalDataSource {
  /// Gets the cached [CurrencyModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CurrencyModel> getLastCurrency();

  Future<void> cacheCurrency(CurrencyModel currencyToCache);
}
