import 'package:prueba_tecnica/data/model/result/data_model.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';

class ResponseModel extends ResponseEntity {
  ResponseModel({
    required super.dataEntityList,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> map) {
    return ResponseModel(
      dataEntityList: List<DataModel>.from(
        (map['docs'] as List<dynamic>)
            .map(
              (x) => DataModel.fromJson(x as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }
}
