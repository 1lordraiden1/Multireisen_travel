// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiServices implements ApiServices {
  _ApiServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://api2-test.multireisen.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FlightResponse> getToken(
    String auth,
    String accept,
    String contentType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Authorization': auth,
      r'Accept': accept,
      r'Content': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<FlightResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/gettoken',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = FlightResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HotelResponse> getHotels(
    String accessToken,
    String version,
    String accept,
    String contentType,
    String auth,
    Map<String, dynamic> body,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Content': contentType,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HotelResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/hotels/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = HotelResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FlightResponse> getFlights(
    String accessToken,
    String version,
    String auth,
    String accept,
    String contentType,
    Map<String, dynamic> body,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Authorization': auth,
      r'Accept': accept,
      r'Content': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<FlightResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/flights/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = FlightResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FlightResponse> filterSearch(
    String accessToken,
    String version,
    String auth,
    String accept,
    int page,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Authorization': auth,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<FlightResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/flights/items',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = FlightResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetRulesResponse> getRules(
    String itemId,
    String accessToken,
    String version,
    String auth,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Authorization': auth,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetRulesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/flights/items/${itemId}/farerules',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetRulesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SelectFlightResponse> selectFlight(
    String itemId,
    String accessToken,
    String version,
    String auth,
    String accept,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Authorization': auth,
      r'Accept': accept,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SelectFlightResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/flights/items/${itemId}/select',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SelectFlightResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SavePassengersResponse> savePassengers(
    String itemId,
    String accessToken,
    String version,
    String auth,
    String accept,
    String contentType,
    Map<String, dynamic> body,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Authorization': auth,
      r'Accept': accept,
      r'Content': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SavePassengersResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/flights/items/${itemId}/passengers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SavePassengersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<FinalizeBookingResponse> finalizeBooking(
    String itemId,
    String bookingId,
    String accessToken,
    String version,
    String auth,
    String accept,
    String contentType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Authorization': auth,
      r'Accept': accept,
      r'Content': contentType,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FinalizeBookingResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/flights/items/${itemId}/book/${bookingId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = FinalizeBookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IssueTicketResponse> issueTicket(
    String bookingId,
    String bookingItemId,
    String accessToken,
    String version,
    String accept,
    String auth,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<IssueTicketResponse>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/bookings/${bookingId}/issue/${bookingItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = IssueTicketResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetBookingResponse> getBookingDetails(
    String bookingId,
    String accessToken,
    String version,
    String accept,
    String auth,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetBookingResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/bookings/${bookingId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetBookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetTicketResponse> getTicket(
    String bookingId,
    String bookingItemId,
    String accessToken,
    String version,
    String accept,
    String auth,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetTicketResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/bookings/${bookingId}/voucher/${bookingItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetTicketResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CheckBookingCancellationResponse> checkBookingCancellation(
    String bookingId,
    String bookingItemId,
    String accessToken,
    String version,
    String accept,
    String auth,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CheckBookingCancellationResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/bookings/${bookingId}/cancelcheck/${bookingItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = CheckBookingCancellationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VoidTicketResponse> cancelBooking(
    String bookingId,
    String bookingItemId,
    String accessToken,
    String version,
    String accept,
    String auth,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<VoidTicketResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/bookings/${bookingId}/cancel/${bookingItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = VoidTicketResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VoidTicketResponse> voidTicket(
    String bookingId,
    String bookingItemId,
    String accessToken,
    String version,
    String accept,
    String auth,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'AccessToken': accessToken,
      r'Version': version,
      r'Accept': accept,
      r'Authorization': auth,
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<VoidTicketResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/bookings/${bookingId}/void/${bookingItemId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = VoidTicketResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
