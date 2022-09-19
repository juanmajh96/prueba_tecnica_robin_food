import 'package:prueba_tecnica/screens/search/model/model.dart';

class SearchViewModel {
  SearchViewModel({required SearchModel model}) : _model = model;

  final SearchModel _model;

  SearchModel get model => _model;

  void dispose() {}
}
