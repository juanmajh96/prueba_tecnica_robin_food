import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';

abstract class ResultRepositories {
  Future<Either<ResultError, ResponseEntity>> getData(
    RequestEntity requestEntity,
  );
}
