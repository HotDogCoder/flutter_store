import 'package:store/features/currencies/domain/entities/currency.dart';

class CurrencyModel extends Currency {
  CurrencyModel({
    required String id,
    required String msg,
  }) : super(
          id: id,
          msg: msg,
        );

  factory CurrencyModel.fromJson(Map<String, dynamic> jsonMap) {
    return CurrencyModel(id: jsonMap['id'], msg: jsonMap['msg']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'msg': msg,
      };
}
