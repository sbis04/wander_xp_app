import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Linode Server Group Code

class LinodeServerGroup {
  static String baseUrl = 'http://172.105.62.34';
  static Map<String, String> headers = {};
  static CreateUserAccountCall createUserAccountCall = CreateUserAccountCall();
  static LoginUserCall loginUserCall = LoginUserCall();
  static GetTripsCall getTripsCall = GetTripsCall();
  static StoreTripCall storeTripCall = StoreTripCall();
  static UpdateTripCall updateTripCall = UpdateTripCall();
  static GetTripCall getTripCall = GetTripCall();
  static StoreFileCall storeFileCall = StoreFileCall();
  static GetPlacesCall getPlacesCall = GetPlacesCall();
  static GetPlaceCall getPlaceCall = GetPlaceCall();
}

class CreateUserAccountCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    String? photoUrl = '',
  }) {
    final body = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "photo_url": "${photoUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateUserAccount',
      apiUrl: '${LinodeServerGroup.baseUrl}/register',
      callType: ApiCallType.POST,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic uid(dynamic response) => getJsonField(
        response,
        r'''$.user[0]''',
      );
  dynamic userName(dynamic response) => getJsonField(
        response,
        r'''$.user[1]''',
      );
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginUser',
      apiUrl: '${LinodeServerGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
        true,
      );
  dynamic userName(dynamic response) => getJsonField(
        response,
        r'''$.user[1]''',
      );
  dynamic uid(dynamic response) => getJsonField(
        response,
        r'''$.user[0]''',
      );
}

class GetTripsCall {
  Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTrips',
      apiUrl: '${LinodeServerGroup.baseUrl}/trips',
      callType: ApiCallType.GET,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {
        'uid': uid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic trips(dynamic response) => getJsonField(
        response,
        r'''$.trips''',
        true,
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class StoreTripCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? placeName = '',
    String? startDate = '',
    String? endDate = '',
    String? flightNumberArrival = '',
    String? flightNumberDeparture = '',
    String? hotelName = '',
    String? hotelAddress = '',
    String? hotelPhone = '',
    String? placesToVisitName = '',
    String? placesToVisitNote = '',
  }) {
    final body = '''
{
  "uid": "${uid}",
  "place_name": "${placeName}",
  "start_date": "${startDate}",
  "end_date": "${endDate}",
  "flight_number_arrival": "${flightNumberArrival}",
  "flight_number_departure": "${flightNumberDeparture}",
  "hotel_name": "${hotelName}",
  "hotel_address": "${hotelAddress}",
  "hotel_phone": "${hotelPhone}",
  "places_to_visit_name": "${placesToVisitName}",
  "places_to_visit_note": "${placesToVisitNote}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StoreTrip',
      apiUrl: '${LinodeServerGroup.baseUrl}/trips',
      callType: ApiCallType.POST,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic trip(dynamic response) => getJsonField(
        response,
        r'''$.trip''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic tripId(dynamic response) => getJsonField(
        response,
        r'''$.trip_id''',
      );
}

class UpdateTripCall {
  Future<ApiCallResponse> call({
    String? tripId = '',
    String? placeName = '',
    String? startDate = '',
    String? endDate = '',
    String? flightNumberArrival = '',
    String? flightNumberDeparture = '',
    String? hotelName = '',
    String? hotelAddress = '',
    String? hotelPhone = '',
  }) {
    final body = '''
{
  "place_name": "${placeName}",
  "start_date": "${startDate}",
  "end_date": "${endDate}",
  "flight_number_arrival": "${flightNumberArrival}",
  "flight_number_departure": "${flightNumberDeparture}",
  "hotel_name": "${hotelName}",
  "hotel_address": "${hotelAddress}",
  "hotel_phone": "${hotelPhone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateTrip',
      apiUrl: '${LinodeServerGroup.baseUrl}/trips/${tripId}/update',
      callType: ApiCallType.POST,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic tripId(dynamic response) => getJsonField(
        response,
        r'''$.trip_id''',
      );
}

class GetTripCall {
  Future<ApiCallResponse> call({
    String? tripId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTrip',
      apiUrl: '${LinodeServerGroup.baseUrl}/trips/${tripId}',
      callType: ApiCallType.GET,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic trip(dynamic response) => getJsonField(
        response,
        r'''$.trip''',
      );
}

class StoreFileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Store File',
      apiUrl: '${LinodeServerGroup.baseUrl}/store_file',
      callType: ApiCallType.POST,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic fileName(dynamic response) => getJsonField(
        response,
        r'''$.file_name''',
      );
}

class GetPlacesCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Places',
      apiUrl: '${LinodeServerGroup.baseUrl}/places',
      callType: ApiCallType.GET,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic placesList(dynamic response) => getJsonField(
        response,
        r'''$.places''',
        true,
      );
  dynamic cities(dynamic response) => getJsonField(
        response,
        r'''$.places[:].city''',
        true,
      );
  dynamic countries(dynamic response) => getJsonField(
        response,
        r'''$.places[:].country''',
        true,
      );
  dynamic imagePaths(dynamic response) => getJsonField(
        response,
        r'''$.places[:].image_path''',
        true,
      );
}

class GetPlaceCall {
  Future<ApiCallResponse> call({
    String? cityName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Place',
      apiUrl: '${LinodeServerGroup.baseUrl}/place',
      callType: ApiCallType.GET,
      headers: {
        ...LinodeServerGroup.headers,
      },
      params: {
        'city': cityName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.place.city''',
      );
  dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.place.country''',
      );
  dynamic imagePath(dynamic response) => getJsonField(
        response,
        r'''$.place.image_path''',
      );
}

/// End Linode Server Group Code

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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
