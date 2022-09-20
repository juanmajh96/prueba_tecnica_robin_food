import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_tecnica/data/datasource/result/result.dart';
import 'package:prueba_tecnica/data/model/result/result.dart';
import 'package:prueba_tecnica/domain/entities/result/result.dart';
import 'package:prueba_tecnica/domain/errors/result/result.dart';

class GetDataApiImpl implements ResultDatasource {
  /// Recibed http client
  GetDataApiImpl({required this.client});

  /// Http client variable
  final http.Client client;

  @override
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity) async {
    final bookNameOrAuthor =
        requestEntity.bookNameOrAuthor.replaceAll(' ', '+');
    final _response = await client.get(
      Uri.parse(
        'http://openlibrary.org/search.json?title=$bookNameOrAuthor',
      ),
    );
    if (_response.statusCode == 200) {
      return ResponseModel.fromJson(
        jsonDecode(_response.body) as Map<String, dynamic>,
      );
    } else {
      throw DatasourceError(
        messageError: 'failed server, status code ${_response.statusCode},',
      );
    }
  }
}
