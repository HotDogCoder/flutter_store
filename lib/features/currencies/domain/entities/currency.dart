import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String id;
  final String msg;

  Currency({
    required this.id,
    required this.msg,
  });

  @override
  List<Object?> get props => [id, msg];

  @override
  bool get stringify => true;
}
