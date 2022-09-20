import 'package:flutter/foundation.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';

class ResultModel {
  ResultModel({
    this.title = 'Ultra 3000 Book \n Search Engine',
    this.description = 'You can to search \n by book name or author',
  });
  // Static
  final String title;
  final String description;

  // Dynamic
  final listDataEntity = ValueNotifier<List<DataEntity>>([]);
  final isLoading = ValueNotifier<bool>(false);
  final isError = ValueNotifier<bool>(false);
}
