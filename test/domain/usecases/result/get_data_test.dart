import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';
import 'package:prueba_tecnica/domain/repositories/result/result.dart';
import 'package:prueba_tecnica/domain/usecases/result/result.dart';

void main() {
  late ResultRepositoriesMock _repositories;
  late GetData _usecase;

  setUpAll(() {
    _repositories = ResultRepositoriesMock();
    _usecase = GetDataImpl(_repositories);
  });

  group('when its succesfull', () {
    test(
      'Its should return ResponseEntity if its succesfull',
      () async {
        // Arrange
        when(() => _repositories.getData(requestEntity)).thenAnswer(
          (_) async => Right(responseEntity),
        );
        // Act
        final _result = await _usecase(requestEntity);
        // Assert
        expect(_result.fold(id, id), isA<ResponseEntity>());
        verify(() => _repositories.getData(requestEntity)).called(1);
      },
    );
  });

  group('when there are  error', () {
    test(
      'Its should return DatasourceError ',
      () async {
        // Arrange
        when(() => _repositories.getData(requestEntity)).thenAnswer(
          (_) async => const Left(DatasourceError()),
        );
        // Act
        final _result = await _usecase(requestEntity);
        // Assert
        expect(_result.fold(id, id), isA<DatasourceError>());
        verify(() => _repositories.getData(requestEntity)).called(1);
      },
    );

    test(
      'Its should return InternetError ',
      () async {
        // Arrange
        when(() => _repositories.getData(requestEntity)).thenAnswer(
          (_) async => const Left(InternetError()),
        );
        // Act
        final _result = await _usecase(requestEntity);
        // Assert
        expect(_result.fold(id, id), isA<InternetError>());
        verify(() => _repositories.getData(requestEntity)).called(1);
      },
    );
  });
}

class ResultRepositoriesMock extends Mock implements ResultRepositories {}

const requestEntity = RequestEntity(bookNameOrAuthor: '');

final responseEntity = ResponseEntity(dataEntityList: <DataEntity>[]);
