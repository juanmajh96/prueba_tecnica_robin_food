import 'package:prueba_tecnica/domain/entities/result/result.dart';

abstract class ResultDatasource {
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity);
}
