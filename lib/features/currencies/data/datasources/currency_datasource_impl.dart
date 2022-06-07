import 'dart:convert';

import 'package:http/http.dart';
import 'package:store/core/error/exceptions.dart';
import 'package:store/core/http_client/http_client.dart';
import 'package:store/features/currencies/data/datasources/currency_remote_data_source.dart';
import 'package:store/features/currencies/data/datasources/endpoints/payment_endpoints.dart';
import 'package:store/features/currencies/data/models/currency_model.dart';

class CurrencyDataSourceImpl implements CurrencyRemoteDataSource {
  final HttpClient client;

  CurrencyDataSourceImpl(this.client);

  @override
  Future<CurrencyModel> showCurrency(String id) async {
    final response = await client.get(PaymentEndpoints.apod(id));
    if (response.statusCode == 200) {
      return CurrencyModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
