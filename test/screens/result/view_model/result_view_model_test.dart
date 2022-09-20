import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';
import 'package:prueba_tecnica/domain/usecases/result/result.dart';
import 'package:prueba_tecnica/screens/result/model/model.dart';
import 'package:prueba_tecnica/screens/result/view_model/view_model.dart';

void main() {
  late ResultViewModel _sut;
  late GetDataMock _usecase;
  late RequestEntity _requestEntity;
  late ResponseEntity _responseEntity;
  late List<DataEntity> _dataEntityList;
  late ResultError _resultInternetError;
  late ResultError _resultDatasourceError;

  setUpAll(() {
    _resultDatasourceError = const DatasourceError();
    _resultInternetError = const InternetError();
    _dataEntityList = <DataEntity>[];
    _requestEntity = const RequestEntity(bookNameOrAuthor: '');
    _responseEntity = ResponseEntity(dataEntityList: _dataEntityList);
    registerFallbackValue(_requestEntity);
    _usecase = GetDataMock();
    _sut = ResultViewModel(
      getData: _usecase,
      model: ResultModel(),
      queryParam: 'dracula',
    );
  });

  group('ResultViewModel, when response is ok', () {
    test(
        'When getData is called, method call() from GetData is called one time',
        () async {
      // Arrange
      when(() => _usecase.call(any())).thenAnswer((_) async {
        return Right(_responseEntity);
      });

      // Act
      _sut.getData();

      // Assert
      verify(() => _usecase.call(any())).called(1);
    });

    test('When getData is called, isLoading value should be true', () async {
      // Arrange
      when(() => _usecase.call(any())).thenAnswer((_) async {
        return Right(_responseEntity);
      });

      // Act
      _sut.getData();

      // Assert
      expect(_sut.model.isLoading.value, true);
    });

    test('When response is ok, listDataEntity value should be List<DataEntity>',
        () async {
      // Arrange
      when(() => _usecase.call(any())).thenAnswer((_) async {
        return Right(_responseEntity);
      });

      // Act
      _sut.getData();

      // Assert
      expect(_sut.model.listDataEntity.value, _dataEntityList);
    });

    test('When getData completed, isLoading value should be false', () async {
      // Arrange
      when(() => _usecase.call(any())).thenAnswer((_) async {
        return Right(_responseEntity);
      });

      // Act
      _sut.getData();

      // Assert
      await untilCalled(() => _usecase.call(any()));
      expect(_sut.model.isLoading.value, false);
    });
  });

  group('ResultViewModel, when response is not ok', () {
    test('When getData return datasourceError, isError value should be true',
        () async {
      // Arrange
      when(() => _usecase.call(any())).thenAnswer((_) async {
        return Left(_resultDatasourceError);
      });

      // Act
      _sut.getData();

      // Assert
      await untilCalled(() => _usecase.call(any()));
      expect(_sut.model.isError.value, true);
    });

    test('When getData return internetError, isError value should be true',
        () async {
      // Arrange
      when(() => _usecase.call(any())).thenAnswer((_) async {
        return Left(_resultInternetError);
      });

      // Act
      _sut.getData();

      // Assert
      await untilCalled(() => _usecase.call(any()));
      expect(_sut.model.isError.value, true);
    });
  });
}

class GetDataMock extends Mock implements GetDataImpl {}
