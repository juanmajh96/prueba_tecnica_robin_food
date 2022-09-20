///Interface for errors
abstract class ResultError implements Exception {}

///[DatasourceError] Throw when the external resource fails
class DatasourceError implements ResultError {
  ///It's get an optional error message
  const DatasourceError({this.messageError = ''});

  ///[messageError] can be null
  final String? messageError;
}

///[InternetError] Throw when there is not internet connection
class InternetError implements ResultError {
  ///It's get an optional error message
  const InternetError({this.messageError = ''});

  ///[messageError] can be null
  final String? messageError;
}
