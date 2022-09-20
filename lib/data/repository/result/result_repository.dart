import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/data/datasource/result/result.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';
import 'package:prueba_tecnica/domain/repositories/result/result.dart';

class ResultRepository implements ResultRepositories {
  const ResultRepository(this._datasource);

  final ResultDatasource _datasource;
  @override
  Future<Either<ResultError, ResponseEntity>> getData(
    RequestEntity requestEntity,
  ) async {
    try {
      final _result = await _datasource.getDatasource(requestEntity);
      return Right(_result);
    } on SocketException {
      return const Left(
        InternetError(messageError: 'internet connection failure'),
      );
    } on DatasourceError catch (error) {
      return Left(
        DatasourceError(messageError: error.messageError),
      );
    } catch (e) {
      return Left(
        DatasourceError(messageError: e.toString()),
      );
    }
  }
}
