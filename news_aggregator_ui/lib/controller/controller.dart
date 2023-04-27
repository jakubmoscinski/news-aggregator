import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_aggregator_ui/controller/client_response.dart';

class Controller {
  final String _baseUrl;

  const Controller({required baseUrl})
      : _baseUrl = baseUrl;

  Future<ClientResponse> getData({required String urlPart, required int timeout}) async {
    try {
      return processResponse(await get(Uri.parse(_baseUrl + urlPart)).timeout(Duration(seconds: timeout)));
    } catch (e) {
      return provideErrorResponse(e);
    }
  }

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

  ClientResponse provideErrorResponse(Object e) {
    return ClientResponse(
        response: [],
        isSuccess: false,
        errorMessage:
        'An error has occurred. Exception message: ${e.toString()}');
  }

}