// ignore_for_file: one_member_abstracts

import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<ResultType, Params> {
  Future<Either<Exception, ResultType>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
