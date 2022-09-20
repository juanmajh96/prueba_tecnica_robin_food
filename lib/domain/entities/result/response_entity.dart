import 'package:prueba_tecnica/domain/entities/result/data_entity.dart';

/// Facade for data
class ResponseEntity {
  /// Data may changed easilynb
  ResponseEntity({
    required this.dataEntityList,
  });

  /// List of DataEntity
  final List<DataEntity> dataEntityList;
}
