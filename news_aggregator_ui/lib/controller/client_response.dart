///Wrapper for:
/// [response] - actual content
/// [isSuccess] - Success flag
/// [errorMessage] - Error/failure description
class ClientResponse {
  final dynamic _response;
  final bool _isSuccess;
  final String? _errorMessage;

  const ClientResponse({required response, required isSuccess, errorMessage})
      : _response = response,
        _isSuccess = isSuccess,
        _errorMessage = errorMessage;

  dynamic get response => _response;
  bool get isSuccess => _isSuccess;
  String? get errorMessage => _errorMessage;
}
