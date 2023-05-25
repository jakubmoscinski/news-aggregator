import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_aggregator_ui/controller/client_response.dart';

class Controller {
  final String _baseUrl;

  const Controller({required baseUrl})
      : _baseUrl = baseUrl;

  ///Allows to perform asynchronous web requests: ([_baseUrl] + [urlPart])
  ///Catches all [e] exceptions - (exceptions of any type) that may appear during the call
  Future<ClientResponse> getData({required String urlPart, required int timeout}) async {
    try {
      return processResponse(await get(Uri.parse(_baseUrl + urlPart)).timeout(Duration(seconds: timeout)));
    } catch (e) {
      return provideErrorResponse(e);
    }
  }

  ///Processes given response [response] - converts given JSON body to [ClientResponse]
  ///Handles HTTP Status Code Errors: [statusCode]
  ///Catches all [e] exceptions - (exceptions of any type) that may appear during the call
  Future<ClientResponse> processResponse(final Response response) async {
    final statusCode = response.statusCode;

    try {
      if (statusCode == 200) {
        final content = jsonDecode(response.body);
        return ClientResponse(response: content, isSuccess: true);
      } else {
        return ClientResponse(
            response: [],
            isSuccess: false,
            errorMessage: 'An error has occurred. Status code: $statusCode');
      }
    } catch (e) {
      return provideErrorResponse(e);
    }
  }

  ///return [ClientResponse] wrapper whenever an error occurs
  ClientResponse provideErrorResponse(Object e) {
    return ClientResponse(
        response: [],
        isSuccess: false,
        errorMessage:
        'An error has occurred. Exception message: ${e.toString()}');
  }

}