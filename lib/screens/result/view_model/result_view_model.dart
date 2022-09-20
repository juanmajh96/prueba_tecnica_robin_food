import 'package:dartz/dartz.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';
import 'package:prueba_tecnica/domain/usecases/result/result.dart';
import 'package:prueba_tecnica/screens/result/model/model.dart';

class ResultViewModel {
  ResultViewModel({
    required ResultModel model,
    required GetData getData,
    required String queryParam,
  })  : _model = model,
        _getData = getData,
        _queryParam = queryParam;

  final ResultModel _model;
  final GetData _getData;
  final String _queryParam;

  ResultModel get model => _model;

  void getData() {
    model.isLoading.value = true;
    _getData
        .call(RequestEntity(bookNameOrAuthor: _queryParam))
        .then(_handleResponse)
        .whenComplete(_finally);
  }

  void _handleResponse(Either<ResultError, ResponseEntity> response) {
    response.fold(
      _showError,
      (r) => model.listDataEntity.value = r.dataEntityList,
    );
  }

  void _showError(ResultError error) => model.isError.value = true;

  void _finally() => model.isLoading.value = false;

  void dispose() {}
}
