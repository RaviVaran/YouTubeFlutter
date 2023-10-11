import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchCall {
  static Future<ApiCallResponse> call({
    String? apiQuery = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'search',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/search/',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'ed8580052amsh6ddbf6dc8334bd0p1ee638jsnf3eee1247418',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {
        'q': apiQuery,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic vedio(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      );
}

class RetriveChannelCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'retriveChannel ',
      apiUrl: 'https://youtube-data8.p.rapidapi.com/channel/videos/',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'ed8580052amsh6ddbf6dc8334bd0p1ee638jsnf3eee1247418',
        'X-RapidAPI-Host': 'youtube-data8.p.rapidapi.com',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic contents(dynamic response) => getJsonField(
        response,
        r'''$.contents.*.video''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
