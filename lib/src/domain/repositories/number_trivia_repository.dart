import 'package:dartz/dartz.dart';

import 'package:pinemoji_app/src/core/error/failures.dart';
import 'package:pinemoji_app/src/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure,NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure,NumberTrivia>> getRandomNumberTrivia();
}