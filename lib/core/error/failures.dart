import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List propieties = const <dynamic>[]]) : super();
}

//General Failures
class ServerFailure extends Failure {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => throw UnimplementedError();
}
