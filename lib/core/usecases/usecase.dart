import 'package:dartz/dartz.dart';
import 'package:store/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// abstract class UseCase<Output, Input> {
//   Future<Either<Failure, Output>> call(Input params);
// }

// class NoParams extends Equatable {
//   @override
//   List<Object> get props => [];
// }
