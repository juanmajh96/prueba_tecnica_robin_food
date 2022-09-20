import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';
import 'package:prueba_tecnica/domain/repositories/result/result.dart';

///[GetData] usecase return data
abstract class GetData {
  ///Get data
  Future<Either<ResultError, ResponseEntity>> call(
    RequestEntity requestEntity,
  );
}

/// Implementation to get Data
class GetDataImpl implements GetData {
  /// Recibed [ResultRepositories]
  const GetDataImpl(this._repositories);

  final ResultRepositories _repositories;

  @override
  Future<Either<ResultError, ResponseEntity>> call(
    RequestEntity requestEntity,
  ) async =>
      _repositories.getData(requestEntity);
}
