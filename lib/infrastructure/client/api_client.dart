import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:uf_profielder_mobile/infrastructure/env/network_constants.dart';
import 'package:uf_profielder_mobile/infrastructure/ext/map_ext.dart';
import 'package:uf_profielder_mobile/infrastructure/types/exceptions/base_exception.dart';
import 'package:uf_profielder_mobile/infrastructure/types/exceptions/form_exception.dart';
import 'package:uf_profielder_mobile/infrastructure/types/exceptions/session_exception.dart';
import 'package:uf_profielder_mobile/infrastructure/types/json.dart';

class APIResult<T> {
  final bool status;
  final T data;
  final String message;

  const APIResult(
      {required this.data, required this.message, required this.status});
}

extension APIResultExt<T> on Future<APIResult<T>> {
  Future<T> get futureData async => (await this).data;
}

class MockedResult {
  final JSON result;
  final int statusCode;
  final Map<String, String> headers;

  const MockedResult(
      {this.result, this.statusCode = 200, this.headers = const {}});
}

abstract class APIClient {
  final String baseURL;

  const APIClient(this.baseURL);

  String buildFullUrl(String extraPath);

  Future<APIResult<T>> post<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? token,
      JSON? query,
      bool shouldPrint = false,
      MockedResult? mockResult});

  Future<APIResult<T>> get<T>(
      {required String path,
      Map<String, String>? headers,
      required MapFromJSON<T> mapper,
      JSON? query,
      bool shouldPrint = false,
      String? token,
      MockedResult? mockResult});

  Future<APIResult<T>> delete<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? token,
      JSON? query,
      bool shouldPrint = false,
      MockedResult? mockResult});

  Future<APIResult<T>> put<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? token,
      JSON? query,
      bool shouldPrint = false,
      MockedResult? mockResult});
}

@LazySingleton(as: APIClient)
class UFClient implements APIClient {
  @override
  Future<APIResult<T>> post<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      JSON? query,
      String? token,
      bool shouldPrint = false,
      MockedResult? mockResult}) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = _buildHeader(headers, token);
      final response = mockResult != null
          ? _mockResult(mockResult)
          : await http.post(
              uri,
              headers: finalHeader,
              body: jsonEncode(body),
            );
      final result = _handleResponse(response, mapper, shouldPrint, path,
          headers: finalHeader, body: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<APIResult<T>> get<T>({
    required String path,
    Map<String, String>? headers,
    required MapFromJSON<T> mapper,
    MockedResult? mockResult,
    JSON? query,
    String? token,
    bool shouldPrint = false,
  }) async {
    final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
    final finalHeader = _buildHeader(headers, token);
    final response = mockResult != null
        ? _mockResult(mockResult)
        : await http.get(
            uri,
            headers: finalHeader,
          );
    return _handleResponse(response, mapper, shouldPrint, path,
        headers: finalHeader);
  }

  @override
  Future<APIResult<T>> delete<T>({
    required String path,
    required MapFromJSON<T> mapper,
    Map<String, String>? headers,
    body,
    String? token,
    query,
    bool shouldPrint = false,
    MockedResult? mockResult,
  }) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = _buildHeader(headers, token);
      final response = mockResult != null
          ? _mockResult(mockResult)
          : await http.delete(
              uri,
              headers: finalHeader,
              body: jsonEncode(body),
            );
      final result = _handleResponse(
        response,
        mapper,
        shouldPrint,
        path,
        headers: finalHeader,
        body: body,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<APIResult<T>> put<T>({
    required String path,
    required MapFromJSON<T> mapper,
    Map<String, String>? headers,
    body,
    String? token,
    query,
    bool shouldPrint = false,
    MockedResult? mockResult,
  }) async {
    try {
      final uri = Uri.parse(buildFullUrl(path)).replace(queryParameters: query);
      final finalHeader = _buildHeader(headers, token);
      final response = mockResult != null
          ? _mockResult(mockResult)
          : await http.put(
              uri,
              headers: finalHeader,
              body: jsonEncode(body),
            );
      final result = _handleResponse(response, mapper, shouldPrint, path,
          headers: finalHeader, body: body);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, String> _buildHeader(
      Map<String, dynamic>? headers, String? token) {
    return {
      "Content-Type": "application/json",
      if (headers != null) ...headers,
      if (token != null) 'Authorization': 'Bearer $token'
    };
  }

  APIResult<T> _handleResponse<T>(
    http.Response response,
    MapFromJSON<T> mapper,
    bool shouldPrint,
    String url, {
    Map<String, String>? headers,
    JSON? body,
  }) {
    if (shouldPrint) {
      _printResponse(response, url, headers: headers, requestBody: body);
    }

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      final mappedData = mapper(result);
      return APIResult<T>(
          status: result['status'],
          data: mappedData,
          message: result['message']);
    }
    if (response.statusCode == 401) {
      throw SessionException(result['message']);
    }
    final resultBody = jsonDecode(response.body);
    if (resultBody is Map<String, dynamic> &&
        resultBody.containsKey("status")) {
      final message = resultBody.getOrNull("message");
      if (message != null) throw BaseException(message);
      final title = resultBody.getOrNull("title");
      if (title != null) {
        final Map<String, List<dynamic>> plainError =
            Map.from(resultBody["errors"]);
        throw FormException(title,
            errors: plainError.map((key, value) =>
                MapEntry(key, value.map((e) => e.toString()).toList())));
      }
    }
    throw BaseException.unknownError();
  }

  void _printResponse(http.Response response, String url,
      {dynamic requestBody, Map<String, String>? headers}) {
    if (kReleaseMode) return;
    debugPrint("====^^^^^^^^^^^^^^^===");
    debugPrint("URL : ${buildFullUrl(url)}");
    debugPrint("Method : ${response.request?.method}");
    if (headers != null) {
      debugPrint("====== Headers =====");
      _printJSONSafely(jsonEncode(headers));
    }

    if (requestBody != null) {
      debugPrint("====== Request Body =====");
      if (requestBody is List || requestBody is Map<String, dynamic>) {
        _printJSONSafely(jsonEncode(requestBody));
      } else if (requestBody is String) {
        debugPrint("Body String : $requestBody");
      }
    }
    debugPrint("Status Code : ${response.statusCode}");
    debugPrint("====== Response Body =====");
    final responseBody = response.body;
    _printJSONSafely(responseBody);
    debugPrint("===vvvvvvvvvvvvvvvvv==");
  }

  dynamic tryDecode(String jsonString) {
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      return null;
    }
  }

  void _printJSONSafely(String body) {
    try {
      if (body.isEmpty) {
        debugPrint("Empty Body");
      } else {
        JsonDecoder decoder = const JsonDecoder();
        final object = decoder.convert(body);
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        String prettyprint = encoder.convert(object);
        prettyprint.split('\n').forEach((element) => debugPrint(element));
      }
    } catch (e) {
      debugPrint("UnFormatted");
      debugPrint(body);
    }
  }

  http.Response _mockResult(MockedResult mockedResult) {
    return http.Response(
        jsonEncode(mockedResult.result), mockedResult.statusCode,
        headers: mockedResult.headers);
  }

  @override
  String get baseURL => NetworkConstants.apiBaseUrl;

  @override
  String buildFullUrl(String extraPath) => "$baseURL$extraPath";
}
