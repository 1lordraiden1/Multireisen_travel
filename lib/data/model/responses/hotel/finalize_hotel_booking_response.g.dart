// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finalize_hotel_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalizeHotelBookingResponse _$FinalizeHotelBookingResponseFromJson(
        Map<String, dynamic> json) =>
    FinalizeHotelBookingResponse(
      accessToken: json['accessToken'] as String?,
      version: json['version'] as String?,
      serverDate: json['serverDate'] == null
          ? null
          : DateTime.parse(json['serverDate'] as String),
      server: json['server'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FinalizeHotelBookingResponseToJson(
        FinalizeHotelBookingResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'version': instance.version,
      'serverDate': instance.serverDate?.toIso8601String(),
      'server': instance.server,
      'data': instance.data,
      'error': instance.error,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bookingId: (json['bookingId'] as num?)?.toInt(),
      refundable: json['refundable'] as bool?,
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      bookings: (json['bookings'] as List<dynamic>?)
          ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bookingId': instance.bookingId,
      'refundable': instance.refundable,
      'price': instance.price,
      'bookings': instance.bookings,
    };

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      type: json['type'] as String?,
      bookingItemId: (json['bookingItemId'] as num?)?.toInt(),
      bookingNumber: json['bookingNumber'] as String?,
      bookingCode: json['bookingCode'] as String?,
      itemId: (json['itemId'] as num?)?.toInt(),
      number: json['number'] as String?,
      code: json['code'] as String?,
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingToJson(Booking instance) => <String, dynamic>{
      'type': instance.type,
      'bookingItemId': instance.bookingItemId,
      'bookingNumber': instance.bookingNumber,
      'bookingCode': instance.bookingCode,
      'itemId': instance.itemId,
      'number': instance.number,
      'code': instance.code,
      'status': instance.status,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      booking: json['booking'] as String?,
      document: json['document'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'booking': instance.booking,
      'document': instance.document,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      currency: json['currency'] as String?,
      netTotal: (json['netTotal'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      margin: (json['margin'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      optionalServices: (json['optionalServices'] as num?)?.toInt(),
      paymentFee: (json['paymentFee'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'currency': instance.currency,
      'netTotal': instance.netTotal,
      'tax': instance.tax,
      'margin': instance.margin,
      'discount': instance.discount,
      'optionalServices': instance.optionalServices,
      'paymentFee': instance.paymentFee,
      'total': instance.total,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
