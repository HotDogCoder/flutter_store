import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/core/error/exceptions.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';

abstract class CurrencyLocalDataSource {
  /// Gets the cached [CurrencyModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CurrencyModel> getLastCurrency(String id);

  Future<void> cacheCurrency(CurrencyModel currencyToCache);
}

const CACHED_CURRENCY = 'CACHED_CURRENCY';

class CurrencyLocalDataSourceImpl implements CurrencyLocalDataSource {
  final SharedPreferences sharedPreferences;
  final http.Client client;

  CurrencyLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.client,
  });

  @override
  Future<CurrencyModel> getLastCurrency(String id) {
    final jsonString = sharedPreferences.getString(CACHED_CURRENCY);
    if (jsonString != null) {
      return Future.value(CurrencyModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCurrency(CurrencyModel currencyToCache) {
    return sharedPreferences.setString(
      CACHED_CURRENCY,
      json.encode(currencyToCache.toJson()),
    );
  }
}
