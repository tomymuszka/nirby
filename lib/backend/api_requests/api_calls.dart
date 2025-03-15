import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start supabase Group Code

class SupabaseGroup {
  static String getBaseUrl() => 'https://hjqqszvninihwpxrknjm.supabase.co';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcXFzenZuaW5paHdweHJrbmptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MTE3ODgsImV4cCI6MjA0MzM4Nzc4OH0.SvPMXl8FZOKba7eZCNA6FSvJ2HbX6Zl-f1OAQDIs0pk',
  };
  static SigninCall signinCall = SigninCall();
  static LoginCall loginCall = LoginCall();
  static BuscarusuariosCall buscarusuariosCall = BuscarusuariosCall();
  static ResetpasswordCall resetpasswordCall = ResetpasswordCall();
  static BuscarservicioCall buscarservicioCall = BuscarservicioCall();
}

class SigninCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "emai": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signin',
      apiUrl: '${baseUrl}/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcXFzenZuaW5paHdweHJrbmptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MTE3ODgsImV4cCI6MjA0MzM4Nzc4OH0.SvPMXl8FZOKba7eZCNA6FSvJ2HbX6Zl-f1OAQDIs0pk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${baseUrl}/auth/v1/token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcXFzenZuaW5paHdweHJrbmptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MTE3ODgsImV4cCI6MjA0MzM4Nzc4OH0.SvPMXl8FZOKba7eZCNA6FSvJ2HbX6Zl-f1OAQDIs0pk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarusuariosCall {
  Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'buscarusuarios',
      apiUrl:
          '${baseUrl}/rest/v1/usuarios?or=(nombre.ilike.%${searchString}%,apellido.ilike.%${searchString}%)&select=id',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcXFzenZuaW5paHdweHJrbmptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MTE3ODgsImV4cCI6MjA0MzM4Nzc4OH0.SvPMXl8FZOKba7eZCNA6FSvJ2HbX6Zl-f1OAQDIs0pk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ResetpasswordCall {
  Future<ApiCallResponse> call({
    String? password = 'muszka2',
    String? token = '4c2c81264ecafb3fc59db7ca90a21b4d3e467825223a98cc5c718bf2',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "type": "recovery",
  "token": "${escapeStringForJson(token)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetpassword',
      apiUrl: '${baseUrl}/auth/v1/verify',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcXFzenZuaW5paHdweHJrbmptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MTE3ODgsImV4cCI6MjA0MzM4Nzc4OH0.SvPMXl8FZOKba7eZCNA6FSvJ2HbX6Zl-f1OAQDIs0pk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarservicioCall {
  Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    final baseUrl = SupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'buscarservicio',
      apiUrl:
          '${baseUrl}/rest/v1/services?title=ilike.*%${searchString}%&select=id',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhqcXFzenZuaW5paHdweHJrbmptIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjc4MTE3ODgsImV4cCI6MjA0MzM4Nzc4OH0.SvPMXl8FZOKba7eZCNA6FSvJ2HbX6Zl-f1OAQDIs0pk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

/// End supabase Group Code

/// Start mercadopago Group Code

class MercadopagoGroup {
  static String getBaseUrl() => 'https://api.mercadopago.com';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer APP_USR-4498385349132964-120514-4ad6c36c62c91284a91f408d84031520-2135320145',
  };
}

/// End mercadopago Group Code

/// Start edge functions Group Code

class EdgeFunctionsGroup {
  static String getBaseUrl() =>
      'https://hjqqszvninihwpxrknjm.supabase.co/functions/v1';
  static Map<String, String> headers = {};
  static CreatesuscriptionCall createsuscriptionCall = CreatesuscriptionCall();
  static CancelsuscriptionCall cancelsuscriptionCall = CancelsuscriptionCall();
  static GetsuscCall getsuscCall = GetsuscCall();
  static SearchpendingreviewsCall searchpendingreviewsCall =
      SearchpendingreviewsCall();
}

class CreatesuscriptionCall {
  Future<ApiCallResponse> call({
    double? amount = 30,
    int? frecuencia = 12,
    String? userId = 'hola',
    String? payerEmail = 'test_user_132879330@testuser.com',
  }) async {
    final baseUrl = EdgeFunctionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "frecuencia": ${frecuencia},
  "user_id": "${escapeStringForJson(userId)}",
  "payer_email": "${escapeStringForJson(payerEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createsuscription',
      apiUrl: '${baseUrl}/crear_plan_suscripcion',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? initpoint(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.init_point''',
      ));
  String? errormessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error.message''',
      ));
}

class CancelsuscriptionCall {
  Future<ApiCallResponse> call({
    String? suscriptionid = '',
  }) async {
    final baseUrl = EdgeFunctionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "subscriptionId": "${escapeStringForJson(suscriptionid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cancelsuscription',
      apiUrl: '${baseUrl}/cancel-suscription',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetsuscCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = EdgeFunctionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${escapeStringForJson(id)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getsusc',
      apiUrl: '${baseUrl}/get_suscription',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? fechafacturacion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.next_payment_date''',
      ));
  int? amount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.auto_recurring.transaction_amount''',
      ));
  int? frecuencia(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.auto_recurring.frequency''',
      ));
  String? createdat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date_created''',
      ));
}

class SearchpendingreviewsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = EdgeFunctionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchpendingreviews',
      apiUrl: '${baseUrl}/send-inapp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End edge functions Group Code

/// Start Sendpulse Group Code

class SendpulseGroup {
  static String getBaseUrl() => 'https://api.sendpulse.com';
  static Map<String, String> headers = {};
  static AccesstokenCall accesstokenCall = AccesstokenCall();
  static SendEmailCall sendEmailCall = SendEmailCall();
}

class AccesstokenCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = SendpulseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "grant_type": "client_credentials",
  "client_id": "8150d10a47d10060fe4404337556b19c",
  "client_secret": "3755281f15ea3ca4cfb3525e7eba1de4"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'accesstoken',
      apiUrl: '${baseUrl}/oauth/access_token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailCall {
  Future<ApiCallResponse> call({
    String? contenido = 'Prueba',
    String? asunto = 'Prueba',
    String? paraNombre = 'Prueba',
    String? paraEmail = 'tomymuszka@gmail.com',
    String? accessToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImRmYWE3OTAzNTFmYmU1YmQzYjk1YWVlYTg1ZTRmMGQwZjVjZTUxMTIwZjJhYzIyM2Y0ZWUyZTk2ZWI4ZTdkNGU4MzRlM2E2YjQ4MTY5Y2E3In0.eyJhdWQiOiI4MTUwZDEwYTQ3ZDEwMDYwZmU0NDA0MzM3NTU2YjE5YyIsImp0aSI6ImRmYWE3OTAzNTFmYmU1YmQzYjk1YWVlYTg1ZTRmMGQwZjVjZTUxMTIwZjJhYzIyM2Y0ZWUyZTk2ZWI4ZTdkNGU4MzRlM2E2YjQ4MTY5Y2E3IiwiaWF0IjoxNzM2MTg5MzUyLCJuYmYiOjE3MzYxODkzNTIsImV4cCI6MTczNjE5Mjk1Miwic3ViIjoiIiwic2NvcGVzIjpbXSwidXNlciI6eyJpZCI6ODQxNTg3OSwiZ3JvdXBfaWQiOm51bGwsInBhcmVudF9pZCI6bnVsbCwiY29udGV4dCI6eyJhY2NsaW0iOiIwIn0sImFyZWEiOiJyZXN0IiwiYXBwX2lkIjpudWxsfX0.Rl862eOt7lC_DcPXJhUycxLKal-ZCrss6Bs4l5r-B8qBl9RzxKhatS8jJhXFsiquhjvfmU66u4cPlyGdKRYDAaekLGM_P4oZ8j7UXhnlXcBqXqSqPiK3cb439M38no3_ojMJ5Ocw-gx2qDx5bh8go-OdDeuK7cf_0jV1XzV-QmpbqZLAEdHFb1hlKEk4yt6GlOmryATFLrBOQOsmBU4tuoAwyXvEIT4jHYwcU5JMq4OkI4Ip4U1qmjMTNSvA0wQveGm9CNew-agtrDabHakGbSV6Sij5Gv9x5RNm_axYjT7PtjOYdtyn2VcKxKuL5gSJoWIcR_LkIzmiiHQ3Kp8cLA',
  }) async {
    final baseUrl = SendpulseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": {
    "html": "${escapeStringForJson(contenido)}",
    "text": "${escapeStringForJson(contenido)}",
    "subject": "${escapeStringForJson(asunto)}",
    "from": {
      "name": "Nirby",
      "email": "info@applashsolutions.com"
    },
    "to": [
      {
        "name": "${escapeStringForJson(paraNombre)}",
        "email": "${escapeStringForJson(paraEmail)}"
      }
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'send email',
      apiUrl: '${baseUrl}/smtp/emails',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Sendpulse Group Code

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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
