import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/data/datasource/result/result.dart';
import 'package:prueba_tecnica/data/model/result/result.dart';
import 'package:prueba_tecnica/data/repository/result/result.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';

void main() {
  late ResultDatasourceMock _datasource;
  late ResultRepository _repository;
  late ResultError _error;

  setUpAll(() {
    _datasource = ResultDatasourceMock();
    _repository = ResultRepository(_datasource);
    _error = const DatasourceError(messageError: 'error');
  });

  group('when its succesfull', () {
    test('its should return ResponseModel object', () async {
      //Arrange
      when(() => _datasource.getDatasource(requestEntity))
          .thenAnswer((_) async => responseModel);
      // Act
      final _result = await _repository.getData(requestEntity);
      // Assert
      expect(_result.fold(id, id), isA<ResponseModel>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });
  });

  group('when there are any error', () {
    test('when is DatasourceError', () async {
      //Arrange
      when(() => _datasource.getDatasource(requestEntity)).thenThrow(_error);
      // Act
      final _result = await _repository.getData(requestEntity);
      // Assert
      expect(_result.fold(id, id), isA<DatasourceError>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });

    test('when is InternetError', () async {
      //Arrange
      when(() => _datasource.getDatasource(requestEntity)).thenThrow(
        const SocketException(''),
      );
      // Act
      final _result = await _repository.getData(requestEntity);
      // Assert
      expect(_result.fold(id, id), isA<InternetError>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });

    test('when is any Error', () async {
      // Arrange
      when(() => _datasource.getDatasource(requestEntity)).thenThrow(
        TypeError(),
      );
      // Act
      final _result = await _repository.getData(requestEntity);
      // Assert
      expect(_result.fold(id, id), isA<DatasourceError>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });
  });
}

class ResultDatasourceMock with Mock implements ResultDatasource {}

const requestEntity = RequestEntity(bookNameOrAuthor: '');

final responseModel = ResponseModel(dataEntityList: []);
